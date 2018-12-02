# RESOURCES

png_object = ChunkyPNG::Image.new(200, 100, ChunkyPNG::Color::rgba(211, 211, 211, 100))
png = png_object.to_datastream.to_s

logo = File.read('./app/assets/images/logo-small.png')

def payload(file)
  "data:image/png;base64,#{Base64.encode64(file)}"
end

# ORGANIZATION
organization = Organization.new(
  name: 'Tijuana Smile Dentistry',
  status: :ACTIVE,
  subdomain: 'tijuanasmiledentistry',
  url: 'https://www.youtube.com/watch?v=FH6wpO66J4k'
)

organization.save || binding.pry

[
  {
    addressable: organization,
    organization: organization,
    city: 'Tijuana',
    country_code: 'MX',
    label: 'HQ',
    line_1: 'Juventud Oriente #8800',
    line_2: 'Interior 2204',
    line_3: nil,
    state_province_county: 'Baja California',
    zip_postal_code: '22010'
  }
].each do |attribute_set|
  address = Address.new(attribute_set)
  address.save || binding.pry
end

[
  {
    emailable: organization,
    organization: organization,
    address: 'info@tijuanasmiledentistry.com',
    confirmed: true
  }
].each do |attribute_set|
  email = Email.new(attribute_set)
  email.save || binding.pry
end

[
  {
    imageable: organization,
    organization: organization,
    description: 'Tijuana Smile Dentistry Logo',
    title: 'Tijuana Smile Dentistry',
    payload: payload(logo),
  }
].each do |attribute_set|
  image = Image.new(attribute_set)
  image.save || binding.pry
end

[
  {
    phoneable: organization,
    organization: organization,
    confirmed: true,
    country_code: 'MX',
    extension: nil,
    label: 'Mexico',
    number: 6642071561
  },
  {
    phoneable: organization,
    organization: organization,
    confirmed: true,
    country_code: 'US',
    extension: nil,
    label: 'United States',
    number: 6194673765
  }
].each do |attribute_set|
  phone = Phone.new(attribute_set)
  phone.save || binding.pry
end

organization.primary_address = organization.addresses.first || binding.pry
organization.primary_email = organization.emails.first || binding.pry
organization.primary_image = organization.images.first || binding.pry
organization.primary_phone = organization.phones.first || binding.pry

organization.save || binding.pry

# SOCIAL PROOFS

5.times.map do
  {
    organization: organization,
    description: Faker::Lorem.paragraph(3),
    title: Faker::Lorem.paragraph(1),
    url: 'https://placehold.it/200x100',
    payload: payload(png)
  }
end.each do |attribute_set|
  social_proof = SocialProof.new(attribute_set.except(:payload))
  social_proof.save || binding.pry

  image = Image.new(
    attribute_set.slice(
      :organization,
      :description,
      :title,
      :payload
    ).merge({
      imageable: social_proof,
    })
  )
  image.save || binding.pry

  social_proof.primary_image = image
  social_proof.save || binding.pry
end

# CATEGORIES

5.times.map do
  {
    organization: organization,
    name: Faker::Lorem.paragraphs(1).join(' '),
    long_description: Faker::Lorem.paragraphs(5).join(' '),
    payload: payload(png),
    short_description: Faker::Lorem.paragraphs(1).join(' '),
    status: :ACTIVE
  }
end.each do |attribute_set|
  category = Category.new(attribute_set.except(:payload))
  category.save || binding.pry

  image = Image.new(
    attribute_set.slice(
      :organization,
      :payload
    ).merge({
      description: attribute_set.fetch(:short_description),
      title: attribute_set.fetch(:name),
      imageable: category
    })
  )
  image.save || binding.pry

  category.primary_image = image
  category.save || binding.pry
end

# ABSTRACT ITEMS
5.times.map do |i|
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "TREATMENT_#{i}",
    name: Faker::Lorem.paragraphs(1).join(' '),
    long_description: Faker::Lorem.paragraphs(10).join(' '),
    primary_kind: :SERVICE,
    secondary_kind: :SERVICE_TREATMENT,
    short_description: Faker::Lorem.paragraphs(1).join(' '),
    status: :ACTIVE,
    url: 'https://www.youtube.com/watch?v=FH6wpO66J4k'
  }
end.each do |attribute_set|
  item = Item.new(attribute_set)
  item.save || binding.pry

  5.times do
    image = Image.new(
      attribute_set.slice(
        :organization,
      ).merge({
        imageable: item,
        description: attribute_set.fetch(:short_description),
        payload: payload(png),
        title: attribute_set.fetch(:name),
      })
    )
    image.save || binding.pry
  end

  item.primary_image = item.images.first || binding.pry
  item.save || binding.pry
end

# CONCRETE ITEMS

Category.all.each do |category|
  10.times.map do |i|
    {
      category: category,
      organization: organization,
      external_price_in_cents: rand(500..1000)*100,
      form: :CONCRETE,
      internal_price_in_cents: rand(100..500)*100,
      key: "ITEM_#{i}",
      name: Faker::Lorem.paragraphs(1).join(' '),
      long_description: Faker::Lorem.paragraphs(5).join(' '),
      primary_kind: :SERVICE,
      secondary_kind: :SERVICE_TREATMENT,
      short_description: Faker::Lorem.paragraphs(1).join(' '),
      status: :ACTIVE
    }
  end.each do |attribute_set|
    item = Item.new(attribute_set.except(:payload))
    item.save || binding.pry

    5.times do
      image = Image.new(
        attribute_set.slice(
          :organization,
        ).merge({
          imageable: item,
          description: attribute_set.fetch(:short_description),
          payload: payload(png),
          title: attribute_set.fetch(:name),
        })
      )
      image.save || binding.pry
    end

    item.primary_image = item.images.first || binding.pry
    item.save || binding.pry
  end
end

# PRODUCERS

5.times.map do
  {
    organization: organization,
    date_of_birth: rand(18..75).years.ago,
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.middle_name,
    payload: payload(png),
    primary_kind: :PRODUCER,
    secondary_kind: :PRODUCER_DOCTOR,
    status: :ACTIVE
  }
end.each do |attribute_set|
  producer = Person.new(attribute_set.except(:payload))
  producer.save || binding.pry

  image = Image.new(
    attribute_set.slice(
      :organization,
      :payload
    ).merge({
      imageable: producer,
      description: producer.calculated_full_name,
      title: producer.calculated_full_name
    })
  )
  image.save || binding.pry

  producer.primary_image = image
  producer.save || binding.pry
end

# CONSUMERS

50.times.map do
  {
    organization: organization,
    date_of_birth: rand(18..75).years.ago,
    city: Faker::Address.city,
    country_code: 'US',
    extension: ((rand() >= 0.5) ? nil : Faker::PhoneNumber.extension),
    first_name: Faker::Name.first_name,
    label: 'Home',
    middle_name: Faker::Name.middle_name,
    number: Faker::PhoneNumber.phone_number.split(' x').first,
    last_name: Faker::Name.middle_name,
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    line_3: nil,
    address: Faker::Internet.email,
    payload: payload(png),
    primary_kind: :CONSUMER,
    secondary_kind: :CONSUMER_PATIENT,
    state_province_county: Faker::Address.state,
    status: :ACTIVE,
    zip_postal_code: Faker::Address.zip_code
  }
end.each do |attribute_set|
  consumer = Person.new(
    attribute_set.except(
      :address,
      :city,
      :country_code,
      :extension,
      :label,
      :line_1,
      :line_2,
      :line_3,
      :number,
      :payload,
      :state_province_county,
      :zip_postal_code
    )
  )

  consumer.save || binding.pry

  address = Address.new(
    attribute_set.slice(
      :organization,
      :city,
      :country_code,
      :label,
      :line_1,
      :line_2,
      :line_3,
      :state_province_county,
      :zip_postal_code
    ).merge({
      addressable: consumer
    })
  )

  email = Email.new(
    attribute_set.slice(
      :organization,
      :address
    ).merge({
      emailable: consumer,
      confirmed: true
    })
  )
  email.save || binding.pry

  image = Image.new(
    attribute_set.slice(
      :organization,
      :payload
    ).merge({
      imageable: consumer,
      description: consumer.calculated_full_name,
      title: consumer.calculated_full_name
    })
  )
  image.save || binding.pry

  phone = Phone.new(
    attribute_set.slice(
      :organization,
      :country_code,
      :extension,
      :label,
      :number
    ).merge({
      phoneable: consumer,
      confirmed: true
    })
  )
  phone.save || binding.pry

  consumer.primary_address = address
  consumer.primary_email = email
  consumer.primary_image = image
  consumer.primary_phone = phone

  consumer.save || binding.pry
end

# INTERNAL TESTIMONIALS

Person.where(
  organization: organization,
  primary_kind: :CONSUMER,
  secondary_kind: :CONSUMER_PATIENT
).each do |consumer|
  testimonial = Testimonial.new({
    organization: organization,
    person: consumer,
    date: rand(1..48).months.ago,
    long_text: Faker::Lorem.paragraphs(10).join(' '),
    rating: nil,
    short_text: Faker::Lorem.paragraphs(1).join(' '),
    source: :INTERNAL,
    status: :ACCEPTED,
    url: ((rand() >= 0.5) ? nil : Faker::Internet.url)
  })
  testimonial.save || binding.pry

  rand(1..5).times do
    item_testimonial_mapping = ItemTestimonialMapping.new({
      item: Item.where(
        organization: organization,
        form: :CONCRETE
      ).order("RANDOM()").first || binding.pry,
      organization: organization,
      testimonial: testimonial
    })
    item_testimonial_mapping.save || binding.pry
  end

  rand(2..5).times do
    image = Image.new({
      imageable: testimonial,
      organization: organization,
      description: Faker::Lorem.paragraphs(1).join(' '),
      payload: payload(png),
      title: "#{consumer.calculated_full_name} Testimonial"
    })
    image.save || binding.pry
  end

  testimonial.after_image = testimonial.images.first || binding.pry
  testimonial.before_image = testimonial.images.last || binding.pry

  testimonial.save || binding.pry
end

# EXTERNAL TESTIMONIALS

Person.where(
  organization: organization,
  primary_kind: :CONSUMER,
  secondary_kind: :CONSUMER_PATIENT
).each do |consumer|
  testimonial = Testimonial.new({
    organization: organization,
    person: consumer,
    date: rand(1..48).months.ago,
    long_text: Faker::Lorem.paragraphs(10).join(' '),
    rating: rand(0..5),
    short_text: Faker::Lorem.paragraphs(1).join(' '),
    source: :EXTERNAL,
    status: :ACCEPTED,
    url: ((rand() >= 0.5) ? nil : 'https://www.youtube.com/embed/oudZlLxMunw')
  })
  testimonial.save || binding.pry

  rand(1..5).times do
    item_testimonial_mapping = ItemTestimonialMapping.new({
      item: Item.where(
        organization: organization,
        form: :CONCRETE
      ).order("RANDOM()").first || binding.pry,
      organization: organization,
      testimonial: testimonial
    })
    item_testimonial_mapping.save || binding.pry
  end

  rand(2..5).times do
    image = Image.new({
      imageable: testimonial,
      organization: organization,
      description: Faker::Lorem.paragraphs(1).join(' '),
      payload: payload(png),
      title: "#{consumer.calculated_full_name} Testimonial"
    })
    image.save || binding.pry
  end

  testimonial.save || binding.pry
end

# LEADS

Person.where(
  organization: organization,
  primary_kind: :CONSUMER,
  secondary_kind: :CONSUMER_PATIENT
).each do |consumer|
  lead = Lead.new({
    organization: organization,
    person: consumer,
    desired_date: rand(1..365).days.from_now,
    desired_time_range: Lead.desired_time_ranges.keys.sample,
    message: Faker::Lorem.paragraphs(rand(1..10)),
    preferred_conversation_channel: Lead.preferred_conversation_channels.keys.sample,
    source: :WEBSITE,
    status: :ACCEPTED
  })
  lead.save || binding.pry

  rand(1..5).times do
    item_lead_mapping = ItemLeadMapping.new({
      item: Item.where(
        organization: organization
      ).order("RANDOM()").first || binding.pry,
      lead: lead,
      organization: organization
    })
    item_lead_mapping.save || binding.pry
  end
end
