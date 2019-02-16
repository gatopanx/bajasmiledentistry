# TODO: Add multiple links (polymorphic) resource

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

def payload(file_content)
  "data:image/png;base64,#{Base64.encode64(file_content)}"
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
end

# CATEGORIES

[
  {
    organization: organization,
    name: "Cleaning",
    long_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth with the intention of preventing cavities, gingivitis, and periodontal disease." ,
    key: 'key1',
    short_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 70*100,
        key: "ITEM_1",
        name: "Cleaning",
        long_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth with the intention of preventing cavities, gingivitis, and periodontal disease.",
        primary_kind: :SERVICE,
        short_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 350*100,
        form: :CONCRETE,
        internal_price_in_cents: 110*100,
        key: "ITEM_2",
        name: "Cleaning By Quadrant",
        long_description: "Is a procedure involving removal of dental plaque and calculus and then smoothing, or planing, of the surfaces of the roots, removing cementum or dentine.",
        primary_kind: :SERVICE,
        short_description: "Is a procedure involving removal of dental plaque and calculus and then smoothing.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Whitening",
    long_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
    key: 'key2',
    short_description: "Tooth whitening lightens teeth.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 375*100,
        form: :CONCRETE,
        internal_price_in_cents: 180*100,
        key: "ITEM_3",
        name: "Teeth Whitening",
        long_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
        primary_kind: :SERVICE,
        short_description: "Tooth whitening lightens teeth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 650*100,
        form: :CONCRETE,
        internal_price_in_cents: 230*100,
        key: "ITEM_4",
        name: "Whitening and Cleaning",
        long_description: "Dental teeth cleaning before whitening helps to remove tartar, thus making whitening more effective.",
        primary_kind: :SERVICE,
        short_description: "Dental teeth cleaning before whitening helps to remove tartar.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 400*100,
        form: :CONCRETE,
        internal_price_in_cents: 220*100,
        key: "ITEM_5",
        name: "Whitening (Home Kit)",
        long_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
        primary_kind: :SERVICE,
        short_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Extractions and Surgery",
    long_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
    key: 'key3',
    short_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 170*100,
        form: :CONCRETE,
        internal_price_in_cents: 70*100,
        key: "ITEM_6",
        name: "Extraction Simple",
        long_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
        primary_kind: :SERVICE,
        short_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 400*100,
        form: :CONCRETE,
        internal_price_in_cents: 150*100,
        key: "ITEM_7",
        name: "Surgical Extraction",
        long_description: "Is a relatively quick outpatient procedure with either local, general, intravenous anesthesia, or a combination.",
        primary_kind: :SERVICE,
        short_description: "Is a quick removal of teeth  with either local, general, intravenous anesthesia, or a combination.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 500*100,
        form: :CONCRETE,
        internal_price_in_cents: 230*100,
        key: "ITEM_8",
        name: "Wisdom Teeth Extraction",
        long_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.",
        primary_kind: :SERVICE,
        short_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 640*100,
        form: :CONCRETE,
        internal_price_in_cents: 230*100,
        key: "ITEM_9",
        name: "Surgical Extraction",
        long_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.",
        primary_kind: :SERVICE,
        short_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 940*100,
        form: :CONCRETE,
        internal_price_in_cents: 230*100,
        key: "ITEM_10",
        name: "Surgical Extraction Wisdom Teeth",
        long_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.",
        primary_kind: :SERVICE,
        short_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Filling",
    long_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
    key: 'key4',
    short_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 65*100,
        key: "ITEM_11",
        name: "Filling",
        long_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
        primary_kind: :SERVICE,
        short_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 300*100,
        form: :CONCRETE,
        internal_price_in_cents: 150*100,
        key: "ITEM_12",
        name: "Restoration",
        long_description: "A dental restoration or dental filling is a treatment to restore the function, integrity, and morphology of missing tooth structure resulting from caries or external trauma as well as to the replacement of such structure supported by dental implants.",
        primary_kind: :SERVICE,
        short_description: "A dental restoration or dental filling is a treatment to restore the function, integrity, and morphology of missing tooth.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Root Canal",
    long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
    key: 'key5',
    short_description: "Root canals are needed when there is an infection within the tooth.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 70*100,
        key: "ITEM_13",
        name: "Root Canal",
        long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
        primary_kind: :SERVICE,
        short_description: "Root canals are needed when there is an infection within the tooth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 70*100,
        key: "ITEM_14",
        name: "Root Canal Molar",
        long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
        primary_kind: :SERVICE,
        short_description: "Root canals are needed when there is an infection within the tooth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 845*100,
        form: :CONCRETE,
        internal_price_in_cents: 350*100,
        key: "ITEM_15",
        name: "Retreatment",
        long_description: "The endodontist will reopen your tooth. Gaining access to the root canal filling material can be more complex than a routine root canal, involving additional steps including the removal of crown, post and core material.",
        primary_kind: :SERVICE,
        short_description: "The endodontist will reopen your tooth. Gaining access to the root canal.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Dentures",
    long_description: "Dentures are removable false teeth made of acrylic (plastic), nylon or metal. They fit snugly over the gums to replace missing teeth and eliminate potential problems caused by gaps.",
    key: 'key6',
    short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 600*100,
        key: "ITEM_16",
        name: "Acrylic Denture",
        long_description: "Dentures are removable false teeth made of acrylic (plastic), nylon or metal. They fit snugly over the gums to replace missing teeth and eliminate potential problems caused by gaps.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 700*100,
        key: "ITEM_17",
        name: "Flexible Denture",
        long_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures. These dentures are made of a thin thermoplastic material such as nylon than thicker more rigid acrylic used in full dentures.",
        primary_kind: :SERVICE,
        short_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 900*100,
        key: "ITEM_18",
        name: "Comfort Denture",
        long_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures. These dentures are made of a thin thermoplastic material such as nylon than thicker more rigid acrylic used in full dentures.",
        primary_kind: :SERVICE,
        short_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Prosthesis",
    long_description: "A dental prosthesis is an intraoral prosthesis used to restore intraoral defects such as missing teeth, missing parts of teeth, and missing soft or hard structures of the jaw and palate.",
    key: 'key7',
    short_description: "A dental prosthesis is an intraoral prosthesis used to restore intraoral defects such as missing teeth",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 280*100,
        key: "ITEM_19",
        name: "Crown (Porcelain Fused to Metal)",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1600*100,
        form: :CONCRETE,
        internal_price_in_cents: 490*100,
        key: "ITEM_20",
        name: "Zirconia Crown",
        long_description: "It is extremely strong, requiring less tooth preparation than other materials. It can be layered with porcelain, further improving its aesthetic appearance.",
        primary_kind: :SERVICE,
        short_description: "It is extremely strong, requiring less tooth preparation than other materials.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1800*100,
        form: :CONCRETE,
        internal_price_in_cents: 470*100,
        key: "ITEM_21",
        name: "Crown on Implant",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1400*100,
        form: :CONCRETE,
        internal_price_in_cents: 480*100,
        key: "ITEM_22",
        name: "Veneer",
        long_description: "A veneer is a layer of material placed over a tooth, isabel-juarez-before improve the aesthetics of a smile and/or protect the tooth's surface from damage.",
        primary_kind: :SERVICE,
        short_description: "A veneer is a layer of material placed over a tooth.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1000*100,
        form: :CONCRETE,
        internal_price_in_cents: 150*100,
        key: "ITEM_23",
        name: "Resin Veneer",
        long_description: "Resin isabel-juarez-before involves very little removal of natural tooth. It, often times, can be done in conjunction with a restorative filling or replacement of old fillings.",
        primary_kind: :SERVICE,
        short_description: "Resin isabel-juarez-before involves very little removal of natural tooth. It can be done in conjunction with a restorative filling.",
        status: :ACTIVE
      }
    ]
  },
  {
    organization: organization,
    name: "Orthodontics",
    long_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
    key: 'key8',
    short_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
    status: :ACTIVE,
    items: [
      {
        organization: organization,
        external_price_in_cents: 8000*100,
        form: :CONCRETE,
        internal_price_in_cents: 2500*100,
        key: "ITEM_24",
        name: "Ortodonthics Treatment",
        long_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
        primary_kind: :SERVICE,
        short_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 900*100,
        form: :CONCRETE,
        internal_price_in_cents: 300*100,
        key: "ITEM_25",
        name: "Down Payment",
        long_description: "Tijuana Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        primary_kind: :SERVICE,
        short_description: "Tijuana Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 60*100,
        key: "ITEM_26",
        name: "Monthly Payment",
        long_description: "Tijuana Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        primary_kind: :SERVICE,
        short_description: "Tijuana Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 250*100,
        key: "ITEM_27",
        name: "Palatal Expander",
        long_description: "Palatal expanteders create more space in a child's mouth by gradually widening the upper jaw.",
        primary_kind: :SERVICE,
        short_description: "Palatal expanders create more space in a child's mouth by gradually widening the upper jaw.",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 350*100,
        form: :CONCRETE,
        internal_price_in_cents: 200*100,
        key: "ITEM_28",
        name: "Retainer (Upper Palate)",
        long_description: "Orthodontic retainers are custom-made devices, that hold teeth in position after surgery or any method of realigning teeth",
        primary_kind: :SERVICE,
        short_description: "Orthodontic retainers are custom-made devices, that hold teeth in position after surgery or any method of realigning teeth",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 500*100,
        form: :CONCRETE,
        internal_price_in_cents: 160*100,
        key: "ITEM_29",
        name: "Fixed Retainer",
        long_description: "Orthodontic retainers are custom-made devices, that hold teeth in position after surgery or any method of realigning teeth",
        primary_kind: :SERVICE,
        short_description: "Orthodontic retainers are custom-made devices, that hold teeth in position after surgery or any method of realigning teeth",
        status: :ACTIVE
      },
      {
        organization: organization,
        external_price_in_cents: 15*100,
        form: :CONCRETE,
        internal_price_in_cents: 15*100,
        key: "ITEM_30",
        name: "Lost Bracket",
        long_description: "A broken braces bracket is the most common inconvenience orthodontic patients face but can easily be fix",
        primary_kind: :SERVICE,
        short_description: "A broken braces bracket is the most common inconvenience orthodontic patients face but can easily be fix",
        status: :ACTIVE
      }
    ]
  },



].each do |category_attribute_set|
  category = Category.new(category_attribute_set.except(:items))
  category.save || binding.pry

  category_attribute_set.fetch(:items).each do |item_attribute_set|
    item = Item.new(item_attribute_set.merge({category: category}))
    item.save || binding.pry
  end
end

# PRODUCERS

[
  {
    organization: organization,
    date_of_birth: Date.parse("28/02/1991"),
    name: "Irving Cota",
    payload: payload(File.read('./db/seeds/images/irving-cota.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE,
    biography: %{
      <h5>Autonomous University of Sinaloa</h5>
      <h6>Doctor of Dental Surgery Degree (2009-2014)</h6>
      <hr/>
      <p>
       Doctor Irving Cota was born and raised in the city of Los Mochis,
      where he went to earn his Doctor of Dental Surgery Degree(2009) at the Autonomous University of Sinaloa.
      Dr. Cota continued his education with coursework in Orthodontics and Fixed Prosthesis (2014).
      </p>
      <p>
      He continued his career in the city of Tijuana, where he currently resides and practices,
      helping over 100 people each month to smile again at Tijuana Smile Dentistry, here he takes the time to
      teach each patient how to care for themselves in order to prevent disease and have the best health possible.
      </p>
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse("16/02/1975"),
    name: "Salvador Vizcaino",
    payload: payload(File.read('./db/seeds/images/salvador-vizcaino.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
    organization: organization,
    date_of_birth: Date.parse("04/08/1974"),
    name: "Verenice Orduno",
    payload: payload(File.read('./db/seeds/images/verenice-orduno.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
    organization: organization,
    date_of_birth: Date.parse("16/04/1964"),
    name: "Yván Rodríguez",
    payload: payload(File.read('./db/seeds/images/yvan-rodriguez.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
    organization: organization,
    date_of_birth: Date.parse("30/04/1995"),
    name: "Jonathan Moncada",
    payload: payload(File.read('./db/seeds/images/jonathan-rodriguez.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
].each do |attribute_set|
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







################################################################################








# External Testimonial

# person
#   primary_email
#   primary_address
#   primary_images
#   primary_phone

# Testimonial
#   images
#   item_testimonial_mappings
#   before_image
#   after_image








# Internal Testimonial

[
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Willey Stanley',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 123',
    line_2: 'Apt b',
    line_3: nil,
    address: 'bob1@microsoft.com',
    payload: payload(File.read('./db/seeds/images/willey-stanley.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja California',
    status: :ACTIVE,
    zip_postal_code: '22045',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'I can smile again, I have a quality work done here, they’re very clean and very professional.I recommend them a 100% Clean, good work, I’m very happy',
      rating: nil,
      short_text: 'I can smile again',
      source: :INTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/yrhoz_7qcX4',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/willey-stanley.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Long Beach',
    country_code: 'US',
    extension: nil,
    name: 'Isabel Juarez',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'isabeljuarez0@microsoft.com',
    payload: payload(File.read('./db/seeds/images/isabel-juarez.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'I had a discomfort in a molar piece, they did 2 extractions and I’m in the process of putting on crowns and making a new bridge.
      My experience has been very good, with all the staff. The doctor is very patient, he takes the time to explain what we need, he is very honest and he is very kind and conscientious of us as patients and from our pockets.',
      rating: nil,
      short_text: 'The doctor is very patient, he takes the time to explain what we need',
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'crowns'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        },
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'San Diego',
    country_code: 'US',
    extension: nil,
    name: 'Adela T',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'adela@microsoft.com',
    payload: payload(File.read('./db/seeds/images/adela-t.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'Awesome job, he did a deep cleaning and a composite filling in my molar, it was fast and easy for him to do, I feel comfortable with him, and now I’m feeling great.',
      rating: nil,
      short_text: 'Awesome job!',
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/adela-t.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'San Diego',
    country_code: 'US',
    extension: nil,
    name: 'Paulina Vizcaino',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'paulina@microsoft.com',
    payload: payload(File.read('./db/seeds/images/paulina-vizcaino.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'Awesome job, he did a deep cleaning and a composite filling in my molar, it was fast and easy for him to do, I feel comfortable with him, and now I’m feeling great.',
      rating: nil,
      short_text: 'Awesome job!',
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'orthodontics'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/paulina-vizcaino.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Los Angeles',
    country_code: 'US',
    extension: nil,
    name: 'Benjamin Orozco',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'benjamin@microsoft.com',
    payload: payload(File.read('./db/seeds/images/benjamin-orozco.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'I feel very comfortable with my new dental bridge, they treated my very well and were very kind, I would recommend Tijuana Smile Dentistry to my friends.',
      rating: nil,
      short_text: 'I feel very comfortable with my new dental bridge',
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'orthodontics'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/benjamin-orozco.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  }
].each do |attribute_set|
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
      :zip_postal_code,
      :testimonial
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

  testimonial = Testimonial.new(
    attribute_set
      .fetch(:testimonial)
      .except(:item_keys, :images)
      .merge({person: consumer})
  )
  testimonial.save || binding.pry

  attribute_set.fetch(:testimonial).fetch(:item_keys).each do |item_key|
    item_testimonial_mapping = ItemTestimonialMapping.new({
      item: Item.find_by!(key: item_key),
      organization: organization,
      testimonial: testimonial
    })
    item_testimonial_mapping.save || binding.pry
  end

  attribute_set.fetch(:testimonial).fetch(:images).each do |image_attribute_set|
    image = Image.new(
      image_attribute_set
        .merge({
          imageable: testimonial
        })
    )
    image.save || binding.pry
  end

  testimonial.after_image = testimonial.images.first || binding.pry
  testimonial.before_image = testimonial.images.last || binding.pry

  testimonial.save || binding.pry
end


# EXTERNAL TESTIMONIALS
# Internal Testimonial

[
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Willey Stanley',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 123',
    line_2: 'Apt b',
    line_3: nil,
    address: 'bob2@microsoft.com',
    payload: payload(File.read('./db/seeds/images/irving-cota.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja California',
    status: :ACTIVE,
    zip_postal_code: '22045',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'Crowns are the best',
      rating: 5,
      short_text: 'Crowns are the best',
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/yrhoz_7qcX4',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/irving-cota.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Long Beach',
    country_code: 'US',
    extension: nil,
    name: 'Isabel Juarez',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'isabeljuarez2@microsoft.com',
    payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'I can smile again, I have a quality work done here, they’re very clean and very professional.I recommend them a 100% Clean, good work, I’m very happy ',
      rating: 4,
      short_text: 'I can smile again',
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/k161HXvnznI',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        },
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    organization: organization,
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Long Beach',
    country_code: 'US',
    extension: nil,
    name: 'Isabel Juarez',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'isabeljuarez3@microsoft.com',
    payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      organization: organization,
      date: Date.parse('01/01/2015'),
      long_text: 'I can smile again, I have a quality work done here, they’re very clean and very professional.I recommend them a 100% Clean, good work, I’m very happy ',
      rating: 4,
      short_text: 'I can smile again',
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/yrhoz_7qcX4',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        },
        {
          organization: organization,
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  }
].each do |attribute_set|
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
      :zip_postal_code,
      :testimonial
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

  testimonial = Testimonial.new(
    attribute_set
      .fetch(:testimonial)
      .except(:item_keys, :images)
      .merge({person: consumer})
  )
  testimonial.save || binding.pry

  attribute_set.fetch(:testimonial).fetch(:item_keys).each do |item_key|
    item_testimonial_mapping = ItemTestimonialMapping.new({
      item: Item.find_by!(key: item_key),
      organization: organization,
      testimonial: testimonial
    })
    item_testimonial_mapping.save || binding.pry
  end

  attribute_set.fetch(:testimonial).fetch(:images).each do |image_attribute_set|
    image = Image.new(
      image_attribute_set
        .merge({
          imageable: testimonial
        })
    )
    image.save || binding.pry
  end

  testimonial.after_image = testimonial.images.first || binding.pry
  testimonial.before_image = testimonial.images.last || binding.pry

  testimonial.save || binding.pry
end
