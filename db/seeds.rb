def png
  random_color =
    ChunkyPNG::Color::rgba(
      rand(0..255),
      rand(0..255),
      rand(0..255),
      100
    )
  width = 200
  height = 100

  ChunkyPNG::Image.new(width, height, random_color).to_datastream.to_s
end

logo = File.read('./app/assets/images/logo-small.png')

def payload(file)
  "data:image/png;base64,#{Base64.encode64(file)}"
end

# ORGANIZATION
organization = Organization.new(
  name: 'Tijuana Smile Dentistry',
  status: :ACTIVE,
  subdomain: 'tijuanasmiledentistry',
  url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
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
    country_code: 'US',
    extension: nil,
    label: 'United States',
    number: 6194673765
  },
  {
    phoneable: organization,
    organization: organization,
    confirmed: true,
    country_code: 'MX',
    extension: nil,
    label: 'Mexico',
    number: 6642071561
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


# CATEGORIES

[
  {
    organization: organization,
    name: Faker::Lorem.paragraphs(1).join(' '),
    long_description: Faker::Lorem.paragraphs(5).join(' '),
    key: 'key1',
    payload: payload(png),
    short_description: Faker::Lorem.paragraphs(1).join(' '),
    status: :ACTIVE
  },
  {
    organization: organization,
    name: Faker::Lorem.paragraphs(1).join(' '),
    long_description: Faker::Lorem.paragraphs(5).join(' '),
    key: 'key2',
    payload: payload(png),
    short_description: Faker::Lorem.paragraphs(1).join(' '),
    status: :ACTIVE
  },
  {
    organization: organization,
    name: Faker::Lorem.paragraphs(1).join(' '),
    long_description: Faker::Lorem.paragraphs(5).join(' '),
    key: 'key3',
    payload: payload(png),
    short_description: Faker::Lorem.paragraphs(1).join(' '),
    status: :ACTIVE
  }
].each do |attribute_set|
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
# Menu Items
[
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "crowns", # Setear
    name: "Crowns", # Setear
    long_description: %{
    <h5>What is a Dental Crown?</h5>
    <p>
      A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed,
      as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well. The crown restores the tooth to its normal shape and function.
    </p>

    <p>
      Crowns are made to blend the color of your teeth and are made from different materials:
    </p>

    <ul>
      <li>Metal</li>
      <li>Zirconia</li>
      <li>Porcelain (fuse to metal or zirconia)</li>
      <li>Ceramic.</li>
    </ul>
    <p>
      To decide on the material for your crown you may consider the location of your tooth,
      the position of the gum, the function of the tooth,  the patient budget and preference.
    </p>

    <h5>How does Dental Crowns Work?</h5>
    <ol>
      <li>
        Your tooth has to be prepared by removing its outer portion and any decay part so the crown will fit.
      </li>
      <li>
        An impression is made to get an exact model for the crown.
      </li>
      <li>
        You will get a temporary crown while you get your permanent crown ready, this takes less than two weeks.
      </li>
      <li>
        When your permanent crown is ready, the dentist places it in your mouth and makes the necessary adjustments.
      </li>
      <li>
        When you and your dentist are satisfied with how it looks and feels, the crown is cemented in place.
      </li>
    </ol>

    <h5>How Long does Crown Last?</h5>
    <p>
      Crowns usually last at least 7 years. In many cases, they last much longer, up to 40 years.
      In many cases the crown is fine, but the tooth underneath it has developed a cavity.
      Therefore, maintaining good oral hygiene will help your crown last longer.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "dental_implants", # Setear
    name: "Dental Implants", # Setear
    long_description: %{
    <h5>What is a Dental Implant?</h5>
    <p>
      Dental implants are an effective way to replace missing teeth. Dental Implants are small posts,
      usually made of titanium, that is surgically positioned into the jawbone beneath your gums.
      Once in place, they become a sturdy base for supporting one or more artificial teeth, called crowns.
    </p>

    <p>
      There are two types of Dental Implants
    </p>

    <dl>
      <dt>Endosteal Implants:</dt>
      <dd>These are surgically implanted directly into the jawbone. Once the gum tissue is healed,
      a second surgery is needed to connect a post to the original implants. Finally,
      an artificial tooth is attached.
      </dd>
      <dt>Subperiosteal Implants:</dt>
      <dd>These consist of a metal frame that is fitted onto the jawbone just below
      the gum tissue. When the gum is healed the frame becomes fixed to the jawbone.
      Posts are attached to the frame, and finally, teeth are mounted to the posts.
      </dd>
    </dl>

    <h5>Why Dental Implants?</h5>
    <p>
      Dental Implants improve your quality of life, they will help you to
      live your life the way you’re used to by replacing missing teeth.
    </p>
    <ul>
      <li>
        Dental Implants can restore almost 100% of your chewing power.
      </li>
      <li>
        Dental Implants will be a permanent part of your life.
      </li>
      <li>
        Dental Implants will keep your good oral health
      </li>
      <li>
        Dental Implants are designed to get you a boost of self-confidence
      </li>
    </ul>

    <h5>How do Dental Implants work?</h5>
    <ol>
      <li>
        Dental implants are placed in your jawbone to bond with your natural bone
        and become a sturdy base for supporting one or more artificial teeth.
      </li>
      <li>
        A connector is placed on top of the dental implant to hold and support your crowns.
      </li>
    </ol>

    <p>
      Implants are more expensive than other methods of tooth replacement,
      but they are more closely simulate the appearance and function of natural teeth.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Dental implants are an effective way to replace missing teeth. Dental Implants are small posts, usually made of titanium, that is surgically positioned into the jawbone beneath your gums.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "dentures", # Setear
    name: "Dentures", # Setear
    long_description: %{
    <h5>What are Dentures?</h5>
    <p>
      If you have lost some or all of your natural teeth, dentures can replace it and improve your quality of life.
      Dentures are replacements for missing teeth that can be taken out and put back into your mouth,
      today’s dentures are natural looking and more comfortable than ever.
    </p>
    <p>
      Dentures can be full and partial, this depends on how many of your teeth are going to be replaced.
    </p>

    <h5>How do Dentures Work?</h5>
    <p>
      With full dentures, a flesh-colored acrylic base fits over your gums. The base of the upper denture covers the palate,
      while that of the lower denture is shaped like a horseshoe to accommodate your tongue.
    </p>
    <p>
      Dentures are custom-made in a dental laboratory from impressions taken of your mouth.
    </p>

    <h5>How Long do Dentures Last?</h5>
    <p>
      The normal lifetime of dentures is about 5 to 10 years, but this depends on the patient,
      our mouth changes naturally with age, your jawline up differently as bones and gums ridges recede and shrink.
    </p>

    <h5>Tips to get used to your dentures</h5>
    <ol>
      <li>Begin by eating soft foods in small pieces.</li>
      <li>Give yourself time to get used to your dentures.</li>
      <li>Practice eating and speaking your denture.</li>
      <li>Visit your dentist regularly.</li>
    </ol>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Dentures are replacements for missing teeth that can be taken out and put back into your mouth, today’s dentures are natural looking and more comfortable than ever.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "orthodontics", # Setear
    name: "Orthodontics", # Setear
    long_description: %{
    <h5>What is Orthodontics?</h5>
    <p>
      Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.
      Crooked teeth and bite problems are solved with orthodontic treatment, the most common one is braces.
    </p>
    <p>
      Braces move teeth by applying pressure. This treatment consists of small brackets cemented to your teeth,
      connected by a wire or rubber bands. The brackets may be metal or tooth colored.
      Braces are available for patients of all ages.
    </p>
    <p>
      Aligners are made of plastic or acrylic material and are worn over your teeth to straighten them.
      Aligners are worn only for a few weeks then you need to get a new set for the next stage of your treatment.
      Aligners are available for teens and adults.
    </p>
    <h5>What are the benefits of orthodontics?</h5>
    <p>
      The benefits of this treatment is a healthier mouth, a beautiful smile, and teeth
      that are more likely to last a lifetime. Orthodontic treatment can be used to correct a bad bite.
      Your teeth, jaws, gums and facial muscles work together to help you chew, speak and smile.
    </p>

    <h5>Tips for Orthodontics</h5>
    <ul>
      <li>
        Keep your teeth clean when wearing braces
      </li>
      <li>
        Don’t eat foods that could get stuck in your braces or bend the wires, don’t eat too many sugary foods this can lead to decay around the brackets that could stain or damage your teeth.
      </li>
      <li>
        Go to all your orthodontics appointments, so your treatment won’t take long.
      </li>
    </ul>

    <h5>Orthodontics AR4</h5>
    <p>
      This system offers you a short term treatment, so you can save money and time.
      It doesn’t hurt in root level, AR4 combines the best of 4 orthodontics systems:
      Roth, Damon, Andrews, and MBT.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly. Crooked teeth and bite problems are solved with orthodontic treatment", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "root_canal", # Setear
    name: "Root Canal", # Setear
    long_description: %{
    <h5>What is a Root Canal?</h5>
    <p>
      Endodontics deals with treating diseases or injuries to the dental pulp. Endodontics is the branch that specializes
      in the root canal and other endodontic treatments, millions of teeth are treated and save with root canal, relieving
      pain and making teeth healthy again.
    </p>

    <h5>How Does Root Canal Work?</h5>
    <p>
      Root canals are needed when there is an infection within the tooth. Without treatment,
      the infection can become severe enough that the tooth has to be removed.
    </p>
    <ol>
      <li>The endodontist administers local anesthesia to numb the tooth.</li>
      <li>Next, the dentist will drill creating an opening to access the inside of the tooth.</li>
      <li>Clear away the damaged and diseased pulp.</li>
      <li>Once the tooth is cleaned and dried, the opening will be closed with a temporary filling. </li>
      <li>When the treatment is finished the filling will be replaced by a permanent crown.</li>
    </ol>

    <h5>How long will the restored tooth last?</h5>
    <p>
    With proper care, most teeth that have had root canal treatment can last a lifetime.
    You have to keep good dental health and regular dental exams.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Endodontics is the branch that specializes in the root canal and other endodontic treatments, millions of teeth are treated and save with root canal, relieving pain and making teeth healthy again.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },
  {
    category: nil,
    organization: organization,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "teeth_whitening", # Setear
    name: "Teeth Whitening", # Setear
    long_description: %{
    <h5>What Is Teeth Whitening?</h5>
    <p>
      Tooth whitening lightens teeth and helps to remove stains and discoloration. Whitening is among the most popular cosmetic dental procedures.
      This treatment is ideal for people who have healthy teeth and gums and want the restoration of a natural tooth shade.
    </p>
    <p>
      There are many teeth whitening systems and products including whitening toothpaste, over-the-counter gels, rinses, strips,
      trays, and whitening products obtained from a dentist.
    </p>

    <h5>Benefits and Risks of Teeth Whitening</h5>
    <p>
      This treatment has a few side effects like tooth sensitivity and gum irrigation,
      but this discomfort typically lasts no more than a few days.
    </p>
    <p>
      Whitening is not a one-time procedure. It will need to be repeated from time to time if you want to maintain a brighter color.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Endodontics is the branch that specializes in the root canal and other endodontic treatments, millions of teeth are treated and save with root canal, relieving pain and making teeth healthy again.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
  },

].each do |attribute_set|
  item = Item.new(attribute_set)
  item.save || binding.pry

  # 5.times do
  #   image = Image.new(
  #     attribute_set.slice(
  #       :organization,
  #     ).merge({
  #       imageable: item,
  #       description: attribute_set.fetch(:short_description),
  #       payload: payload(png),
  #       title: attribute_set.fetch(:name),
  #     })
  #   )
  #   image.save || binding.pry
  # end

  # item.primary_image = item.images.first || binding.pry
  # item.save || binding.pry
end

# CONCRETE ITEMS
# Price List

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
    name: Faker::Name.first_name,
    payload: payload(png),
    primary_kind: :PRODUCER,
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
      description: producer.name,
      title: producer.name
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
    name: Faker::Name.first_name,
    label: 'Home',
    number: Faker::PhoneNumber.phone_number.split(' x').first,
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    line_3: nil,
    address: Faker::Internet.email,
    payload: payload(png),
    primary_kind: :CONSUMER,
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
      description: consumer.name,
      title: consumer.name
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
  primary_kind: :CONSUMER
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
        form: :ABSTRACT,
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
      title: "#{consumer.name} Testimonial"
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
  primary_kind: :CONSUMER
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
        form: :ABSTRACT,
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
      title: "#{consumer.name} Testimonial"
    })
    image.save || binding.pry
  end

  testimonial.save || binding.pry
end

# LEADS

Person.where(
  organization: organization,
  primary_kind: :CONSUMER
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
