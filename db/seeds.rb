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
  name: 'Baja Smile Dentistry',
  status: :ACTIVE,
  subdomain: 'bajasmiledentistry',
  url: 'https://www.youtube.com/embed/Kn7gTevGx6s'
)

organization.save || binding.pry

RequestStore.store[:current_organization] ||= organization

[
  {
    addressable: organization,
    city: 'Tijuana',
    country_code: 'MX',
    label: 'HQ',
    line_1: 'Juventud Oriente #8800',
    line_2: 'Interior 2204',
    line_3: 'Zona Rio',
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
    address: 'info@bajasmiledentistry.com',
    confirmed: true
  }
].each do |attribute_set|
  email = Email.new(attribute_set)
  email.save || binding.pry
end

[
  {
    imageable: organization,
    description: 'Baja Smile Dentistry Logo',
    title: 'Baja Smile Dentistry',
    payload: payload(logo),
  }
].each do |attribute_set|
  image = Image.new(attribute_set)
  image.save || binding.pry
end

[
  {
    phoneable: organization,
    confirmed: true,
    country_code: 'US',
    extension: nil,
    label: 'United States',
    number: 6194673765
  },
  {
    phoneable: organization,
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
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "crowns", # Setear
    name: "Crowns", # Setear
    long_description: %{
    <h5>What is a Dental Crown?</h5>
    <p>
      A dental crown is a tooth-shaped cover or cap placed over a tooth that is too damaged by decayed for a dental filling
      to adequately support or replace the mission portion; crowns can be used to improve appearance, as well. A crown restores
      the tooth to its normal shape and function.
    </p>

    <p>
      Crowns are made to blend with the color of your teeth and are made from different materials:
    </p>

    <ul>
      <li>Metal</li>
      <li>Zirconia</li>
      <li>Porcelain (fused to metal or zirconia)</li>
      <li>Ceramic</li>
    </ul>
    <p>
      In order to determine the material that fits your crown needs, it is best to consider the location of the damaged tooth,
      the relative position of the gum, the function of the tooth, and your personal budget and preference.
    </p>

    <h5>How does Dental Crowns Work?</h5>
    <ol>
      <li>
        Your tooth needs to be prepared by removing its outer portion and any decayed parts to ensure the crown will fit.
      </li>
      <li>
        A dental impression is made to get an exact model for the crown.
      </li>
      <li>
        You will be provided with a temporary crown while your permanent crown is elaborated; the process takes less than two weeks.
      </li>
      <li>
        When your permanent crown is ready, the dentist installs it in your tooth and makes the necessary adjustments.
      </li>
      <li>
        When you and your dentist are satisfied with how it looks, feels, and functions, the crown is cemented in place.
      </li>
    </ol>

    <h5>How Long does Crown Last?</h5>
    <p>
      Crowns usually last at least 7 years. In many cases, they last much longer, up to 40 years. In some cases, the crown itself
      remains in prime state, but the tooth underneath it develops a cavity. Therefore, maintaining proper oral hygiene will help
      your dental crown work last longer.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "A dental crown is a tooth-shaped cover or cap placed over a tooth that is too damaged by decayed for a dental filling
    to adequately support or replace the mission portion.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/hVeYViHcNTk'
  },
  {
    category: nil,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "dental_implants", # Setear
    name: "Dental Implants", # Setear
    long_description: %{
    <h5>What is a Dental Implant?</h5>
    <p>
      Dental implants are an effective way to replace missing teeth. Dental implants are small posts—usually made
      of titanium—that are surgically inserted into the jawbone beneath the gum. Once in place, they become a sturdy
      base for supporting artificial teeth, called crowns.
    </p>

    <p>
      There are two types of Dental Implants
    </p>

    <dl>
      <dt>Endosteal Implants:</dt>
      <dd>
        These are surgically implanted directly into the jawbone. Once the gum tissue is healed, a second surgery
        is needed to connect a post to the original implants. Finally, an artificial tooth is attached.
      </dd>
      <dt>Subperiosteal Implants:</dt>
      <dd>
        These consist of a metal frame that is fitted onto the jawbone below the gum tissue. When the gum is healed
        the frame becomes fixed to the jawbone. Posts are attached to the frame, and finally, teeth are mounted onto the posts.
      </dd>
    </dl>

    <h5>Why Dental Implants?</h5>
    <p>
      Dental Implants improve your quality of life: they help you to live your life the way you are used to by replacing missing teeth.
    </p>
    <ul>
      <li>
        Dental implants can restore almost 100% of your chewing strength.
      </li>
      <li>
        Dental implants become a permanent part of your life.
      </li>
      <li>
        Dental implants help maintain good oral health.
      </li>
      <li>
        Dental implants are aesthetically designed to boost yourself-confidence.
      </li>
    </ul>

    <h5>How do Dental Implants work?</h5>
    <ol>
      <li>
        Dental implants are placed in your jawbone to bond with your natural bone and become a sturdy base for supporting artificial teeth.
      </li>
      <li>
        A connector is placed on top of the dental implant to hold and support your crowns.
      </li>
    </ol>

    <p>
      Implants are more expensive than other methods of tooth replacement, but they better emulate the appearance and function of natural teeth.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Dental implants are small posts—usually made of titanium—that are surgically inserted into the jawbone beneath the gum.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/DoI97MAlnXs'
  },
  {
    category: nil,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "dentures", # Setear
    name: "Dentures", # Setear
    long_description: %{
    <h5>What are Dentures?</h5>
    <p>
      If you have lost some or all of your natural teeth, dentures can replace them and improve your quality of life.
      Dentures are replacements for missing teeth; they can be removed and reinserted at leisure. Today’s dentures are
      natural-looking and more comfortable than ever.
    </p>

    <p>
      Dentures can be full or partial depending on how many teeth they are replacing.
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
      The average lifespan of dentures ranges between 5 and 10 years depending on the patient:
      the mouth changes naturally with age, and so do jawlines, as bones and gum ridges recede and shrink.
    </p>

    <h5>Tips to get used to your dentures</h5>
    <ol>
      <li>Begin by eating soft foods in small pieces, initially.</li>
      <li>Give yourself time to adapt to the feeling of your dentures.</li>
      <li>Practice eating and speaking with your dentures.</li>
      <li>Visit your dentist regularly.</li>
    </ol>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Dentures are replacements for missing teeth; they can be removed and reinserted at leisure.
    Today’s dentures are natural-looking and more comfortable than ever.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/hVeYViHcNTk'
  },
  {
    category: nil,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "orthodontics", # Setear
    name: "Orthodontics", # Setear
    long_description: %{
    <h5>What is Orthodontics?</h5>
    <p>
      Orthodontics is the branch of dentistry that corrects teeth and jaws that are inadequately positioned.
      Crooked teeth and bite problems are solved with orthodontic procedures—the most common one is braces.
    </p>

    <p>
    Braces reposition teeth by applying pressure. The procedure consists of small brackets cemented between your teeth,
    connected by wire or rubber bands. Brackets can have metallic or tooth coloring. Braces are available for patients of all ages.
    </p>

    <p>
    Aligners are made of plastic or acrylic materials and are worn over teeth to straighten them.
    Aligners are worn only for a few weeks, after which it is necessary to progress to a new, updated set for the next stage of the treatment.
    Aligners are available for teens and adults.
    </p>

    <h5>What are the benefits of orthodontics?</h5>
    <p>
    The benefits of orthodontic treatment are an improved oral health, a beautiful smile, and teeth with improved longevity.
    Orthodontic treatment can be used to correct a bad bite pattern.
    Your teeth, jaws, gums and facial muscles work together when you chew, speak and smile.
    </p>

    <h5>Tips for Orthodontics</h5>
    <ul>
      <li>
        Keep your teeth clean throughout the day while wearing braces.
      </li>
      <li>
        Do not eat foods that could get stuck in your braces or bend their wires; do not eat too many sugary foods,
        as this can lead to decay around the brackets that could stain or damage your teeth.
      </li>
      <li>
        Attend all your regular dentist appointments, so your treatment progresses at an adequate pace.
      </li>
    </ul>

    <h5>Orthodontics AR4</h5>
    <p>
      This system offers you a short term treatment in order for you to save money and time.
      It does generate any damage at root level. AR4 combines the best of four orthodontics systems: Roth, Damon, Andrews, and MBT.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are inadequately positioned.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/FIIMu6rqlDQ'
  },
  {
    category: nil,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "root_canal", # Setear
    name: "Root Canal", # Setear
    long_description: %{
    <h5>What is a Root Canal?</h5>
    <p>
    Endodontics deals with treating diseases or injuries in the dental pulp. Endodontics is the branch that specializes
    in the root canals among other treatments; millions of teeth are treated and saved with root canals, relieving pain
    and making teeth healthy again.
    </p>

    <h5>How Does Root Canal Work?</h5>
    <p>
    Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe
    enough that the tooth has to be removed.
    </p>
    <ol>
      <li>The endodontist administers local anesthesia to numb the tooth’s region.</li>
      <li>The dentist performs drilling to create a small opening to access the inside of the tooth.</li>
      <li>The damaged and diseased pulp tissue is removed.</li>
      <li>Once the tooth is cleaned and dried, the opening is closed with a temporary filling.</li>
      <li>When the treatment is finished, the filling is replaced by a permanent crown.</li>
    </ol>

    <h5>How long will the restored tooth last?</h5>
    <p>
    With proper care, most teeth that have had root canal treatment can last a lifetime.
    You do need, however, to keep good dental health and follow up regular dental exams.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Endodontics is the branch that specializes in the root canals among other treatments; millions of teeth are treated and saved with root canals", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/WojDxKZCcXQ'
  },
  {
    category: nil,
    external_price_in_cents: nil,
    form: :ABSTRACT,
    internal_price_in_cents: nil,
    key: "teeth_whitening", # Setear
    name: "Teeth Whitening", # Setear
    long_description: %{
    <h5>What Is Teeth Whitening?</h5>
    <p>
      Tooth whitening is a procedure that whitens teeth coloration and helps to remove stains and discoloration.
      Whitening is among the most popular cosmetic dental procedures. This treatment is ideal for people who have healthy
      teeth and gums and want to restore a natural shade of white to their teeth.
    </p>
    <p>
      There are many teeth whitening systems and products including whitening toothpaste, over-the-counter gels, rinses, strips,
      trays, and whitening products obtained from a dentist.
    </p>

    <h5>Benefits and Risks of Teeth Whitening</h5>
    <p>
      This treatment has a few side effects like tooth sensitivity and gum irritation,
      but said discomfort typically lasts a few days at most.
    </p>
    <p>
      Whitening is not a one-time procedure: it will need to be repeated from time to time if you want to maintain a brighter color.
    </p>
    }, # Setear
    primary_kind: :SERVICE,
    short_description: "Tooth whitening is a procedure that whitens teeth coloration and helps to remove stains and discoloration.", # Setear
    status: :ACTIVE,
    url: 'https://www.youtube.com/embed/1QkuKCs7gUw'
  },

].each do |attribute_set|
  item = Item.new(attribute_set)
  item.save || binding.pry
end

# CATEGORIES

[
  {
    name: "Cleaning",
    long_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth with the intention of preventing cavities, gingivitis, and periodontal disease." ,
    key: 'key1',
    short_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 40*100,
        key: "ITEM_1",
        name: "Regular Cleaning",
        long_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth with the intention of preventing cavities, gingivitis, and periodontal disease.",
        primary_kind: :SERVICE,
        short_description: "Teeth cleaning is part of oral hygiene and involves the removal of dental plaque from teeth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 350*100,
        form: :CONCRETE,
        internal_price_in_cents: 65*100,
        key: "ITEM_2",
        name: "Deep Cleaning (Per Quadrant)",
        long_description: "Is a procedure involving removal of dental plaque and calculus and then smoothing, or planing, of the surfaces of the roots, removing cementum or dentine.",
        primary_kind: :SERVICE,
        short_description: "Is a procedure involving removal of dental plaque and calculus and then smoothing.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 2000*100,
        form: :CONCRETE,
        internal_price_in_cents: 185*100,
        key: "ITEM_9",
        name: "Periodontal Maintenance",
        long_description: "A periodontal maintenance is also a teeth cleaning, however, it is performed on patients who have gum disease.",
        primary_kind: :SERVICE,
        short_description: "A periodontal maintenance is also a teeth cleaning, however, it is performed on patients who have gum disease.",
        status: :ACTIVE
      }
    ]
  },
  {
    name: "Whitening",
    long_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
    key: 'key2',
    short_description: "Tooth whitening lightens teeth.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 375*100,
        form: :CONCRETE,
        internal_price_in_cents: 245*100,
        key: "ITEM_3",
        name: "Teeth Whitening",
        long_description: "Tooth whitening lightens teeth and helps to remove stains and discoloration.",
        primary_kind: :SERVICE,
        short_description: "Tooth whitening lightens teeth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 650*100,
        form: :CONCRETE,
        internal_price_in_cents: 285*100,
        key: "ITEM_4",
        name: "Whitening and Cleaning",
        long_description: "Dental teeth cleaning before whitening helps to remove tartar, thus making whitening more effective.",
        primary_kind: :SERVICE,
        short_description: "Dental teeth cleaning before whitening helps to remove tartar.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 400*100,
        form: :CONCRETE,
        internal_price_in_cents: 250*100,
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
    name: "Extractions and Surgery",
    long_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
    key: 'key3',
    short_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 170*100,
        form: :CONCRETE,
        internal_price_in_cents: 75*100,
        key: "ITEM_6",
        name: "Simple Dental Extraction",
        long_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
        primary_kind: :SERVICE,
        short_description: "A dental extraction is the removal of teeth from the dental alveolus in the alveolar bone.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 400*100,
        form: :CONCRETE,
        internal_price_in_cents: 95*100,
        key: "ITEM_7",
        name: "Surgical Dental Extraction",
        long_description: "Is a relatively quick outpatient procedure with either local, general, intravenous anesthesia, or a combination.",
        primary_kind: :SERVICE,
        short_description: "Is a quick removal of teeth  with either local, general, intravenous anesthesia, or a combination.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 500*100,
        form: :CONCRETE,
        internal_price_in_cents: 195*100,
        key: "ITEM_8",
        name: "Simple Wisdom Tooth Extraction",
        long_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth — the four permanent adult teeth located at the back corners of your mouth on the top and bottom.",
        primary_kind: :SERVICE,
        short_description: "Wisdom tooth extraction is a surgical procedure to remove one or more wisdom teeth.",
        status: :ACTIVE
      },
      {
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
    name: "Filling",
    long_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
    key: 'key4',
    short_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 150*100,
        form: :CONCRETE,
        internal_price_in_cents: 65*100,
        key: "ITEM_11",
        name: "White Composite Resin Fillings",
        long_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
        primary_kind: :SERVICE,
        short_description: "A filling is a way to restore a tooth damaged by decay back to its normal function and shape.",
        status: :ACTIVE
      },
      {
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
    name: "Root Canal",
    long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
    key: 'key5',
    short_description: "Root canals are needed when there is an infection within the tooth.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 1000*100,
        form: :CONCRETE,
        internal_price_in_cents: 295*100,
        key: "ITEM_13",
        name: "Front Tooth Root Canal",
        long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
        primary_kind: :SERVICE,
        short_description: "Root canals are needed when there is an infection within the tooth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1200*100,
        form: :CONCRETE,
        internal_price_in_cents: 305*100,
        key: "ITEM_14",
        name: "Pre Molar Root Canal",
        long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
        primary_kind: :SERVICE,
        short_description: "Root canals are needed when there is an infection within the tooth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1200*100,
        form: :CONCRETE,
        internal_price_in_cents: 315*100,
        key: "ITEM_37",
        name: "Molar Root Canal",
        long_description: "Root canals are needed when there is an infection within the tooth. Without treatment, the infection can become severe enough that the tooth has to be removed",
        primary_kind: :SERVICE,
        short_description: "Root canals are needed when there is an infection within the tooth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 845*100,
        form: :CONCRETE,
        internal_price_in_cents: 350*100,
        key: "ITEM_15",
        name: "Root Canal Retreatment",
        long_description: "The endodontist will reopen your tooth. Gaining access to the root canal filling material can be more complex than a routine root canal, involving additional steps including the removal of crown, post and core material.",
        primary_kind: :SERVICE,
        short_description: "The endodontist will reopen your tooth. Gaining access to the root canal.",
        status: :ACTIVE
      }
    ]
  },
  {
    name: "Dentures",
    long_description: "Dentures are removable false teeth made of acrylic (plastic), nylon or metal. They fit snugly over the gums to replace missing teeth and eliminate potential problems caused by gaps.",
    key: 'key6',
    short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 699*100,
        key: "ITEM_16",
        name: "Acrylic Denture",
        long_description: "Dentures are removable false teeth made of acrylic (plastic), nylon or metal. They fit snugly over the gums to replace missing teeth and eliminate potential problems caused by gaps.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 750*100,
        key: "ITEM_17",
        name: "Flexible Denture",
        long_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures. These dentures are made of a thin thermoplastic material such as nylon than thicker more rigid acrylic used in full dentures.",
        primary_kind: :SERVICE,
        short_description: "Flexible Dentures are a kind of partial denture, made up of a softer material than regular dentures.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 899*100,
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
    name: "Prosthesis",
    long_description: "A dental prosthesis is an intraoral prosthesis used to restore intraoral defects such as missing teeth, missing parts of teeth, and missing soft or hard structures of the jaw and palate.",
    key: 'key7',
    short_description: "A dental prosthesis is an intraoral prosthesis used to restore intraoral defects such as missing teeth",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 299*100,
        key: "ITEM_19",
        name: "Porcelain Fuse to metal Crown (PFM)",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1600*100,
        form: :CONCRETE,
        internal_price_in_cents: 499*100,
        key: "ITEM_20",
        name: "Lava Zirconia Crown",
        long_description: "It is extremely strong, requiring less tooth preparation than other materials. It can be layered with porcelain, further improving its aesthetic appearance.",
        primary_kind: :SERVICE,
        short_description: "It is extremely strong, requiring less tooth preparation than other materials.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1800*100,
        form: :CONCRETE,
        internal_price_in_cents: 399*100,
        key: "ITEM_21",
        name: "Porcelain Fuse to Metal Crown (Over Dental Implant)",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1800*100,
        form: :CONCRETE,
        internal_price_in_cents: 420*100,
        key: "ITEM_38",
        name: "EMAX Cerec Crown",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1800*100,
        form: :CONCRETE,
        internal_price_in_cents: 599*100,
        key: "ITEM_39",
        name: "Lava Zirconia Crown (Over Dental Implant)",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1800*100,
        form: :CONCRETE,
        internal_price_in_cents: 520*100,
        key: "ITEM_40",
        name: "EMAX Cerec Crown (Over Dental Implant)",
        long_description: "A crown is a tooth-shaped cover or cap placed over a tooth that is badly damaged by decayed, as a result, a filling can’t replace enough of the tooth or make the tooth strong enough, crowns can be used to improve appearance as well.",
        primary_kind: :SERVICE,
        short_description: "Dentures are removable false teeth made of acrylic, nylon or metal.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1400*100,
        form: :CONCRETE,
        internal_price_in_cents: 420*100,
        key: "ITEM_22",
        name: "Veneers",
        long_description: "A veneer is a layer of material placed over a tooth, isabel-juarez-before improve the aesthetics of a smile and/or protect the tooth's surface from damage.",
        primary_kind: :SERVICE,
        short_description: "A veneer is a layer of material placed over a tooth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1000*100,
        form: :CONCRETE,
        internal_price_in_cents: 120*100,
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
    name: "Orthodontics",
    long_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
    key: 'key8',
    short_description: "Orthodontics is the branch of dentistry that corrects teeth and jaws that are positioned improperly.",
    status: :ACTIVE,
    items: [
      {
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
        external_price_in_cents: 900*100,
        form: :CONCRETE,
        internal_price_in_cents: 300*100,
        key: "ITEM_25",
        name: "Down Payment",
        long_description: "Baja Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        primary_kind: :SERVICE,
        short_description: "Baja Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 60*100,
        key: "ITEM_26",
        name: "Monthly Payment",
        long_description: "Baja Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        primary_kind: :SERVICE,
        short_description: "Baja Smile Dentistry will design your beautiful smile with affordable prices and low down payment for braces.",
        status: :ACTIVE
      },
      {
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
        external_price_in_cents: 15*100,
        form: :CONCRETE,
        internal_price_in_cents: 15*100,
        key: "ITEM_30",
        name: "Lost Bracket",
        long_description: "A broken braces bracket is the most common inconvenience orthodontic patients face but can easily be fix",
        primary_kind: :SERVICE,
        short_description: "A broken braces bracket is the most common inconvenience orthodontic patients face but can easily be fix",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 400*100,
        key: "ITEM_36",
        name: "Mini Implants (per implant)",
        long_description: "The mini implant is a dental implant that is fabricated with a reduced diameter and a shorter length but with the same biocompatible material as compared with standard dental implants.",
        primary_kind: :SERVICE,
        short_description: "The mini implant is a dental implant that is fabricated with a reduced diameter and a shorter length but with the same biocompatible material as compared with standard dental implants.",
        status: :ACTIVE
      }
    ]
  },
  {
    name: "Dental Implants",
    long_description: "Dental implants are small posts that are surgically inserted into the jawbone beneath the gum.",
    key: 'key9',
    short_description: "Dental implants are small posts that are surgically inserted into the jawbone beneath the gum.",
    status: :ACTIVE,
    items: [
      {
        external_price_in_cents: 2000*100,
        form: :CONCRETE,
        internal_price_in_cents: 350*100,
        key: "ITEM_31",
        name: "Bone Graft (Per tooth)",
        long_description: "Bone grafting is a surgical procedure done when you need to repair bone fractures or replace bone loss.",
        primary_kind: :SERVICE,
        short_description: "Bone grafting is a surgical procedure done when you need to repair bone fractures or replace bone loss.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 3700*100,
        form: :CONCRETE,
        internal_price_in_cents: 1500*100,
        key: "ITEM_32",
        name: "Sinus lift",
        long_description: "A sinus lift is surgery that adds bone to your upper jaw in the area of your molars and premolars.",
        primary_kind: :SERVICE,
        short_description: "A sinus lift is surgery that adds bone to your upper jaw in the area of your molars and premolars.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 899*100,
        key: "ITEM_33",
        name: "Titanium Implant",
        long_description: "Titanium is a type of metal often used in dental implants because its properties are known to fuse well with human bone.",
        primary_kind: :SERVICE,
        short_description: "Titanium is a type of metal often used in dental implants because its properties are known to fuse well with human bone.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 2500*100,
        form: :CONCRETE,
        internal_price_in_cents: 1500*100,
        key: "ITEM_34",
        name: "Implant Nobel",
        long_description: "Nobel biocare is one of the top implants systems used in USA in replacing missing teeth.",
        primary_kind: :SERVICE,
        short_description: "Nobel biocare is one of the top implants systems used in USA in replacing missing teeth.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 75*100,
        key: "ITEM_35",
        name: "Dental Implant Abutment",
        long_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        primary_kind: :SERVICE,
        short_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1500*100,
        form: :CONCRETE,
        internal_price_in_cents: 470*100,
        key: "ITEM_41",
        name: "Crown on Implant (Porcelain)",
        long_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        primary_kind: :SERVICE,
        short_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        status: :ACTIVE
      },
      {
        external_price_in_cents: 1600*100,
        form: :CONCRETE,
        internal_price_in_cents: 599*100,
        key: "ITEM_42",
        name: "Crown on Implant (Zirconia)",
        long_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        primary_kind: :SERVICE,
        short_description: "This is used in the context of a fixed bridge, partial removable dentures and in implants.",
        status: :ACTIVE
      },
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
      Doctor Irving Cota was born and raised in the city of Los Mochis, where he earned his
      Doctor of Dental Surgery degree (2009) at the Autonomous University of Sinaloa. Dr. Cota
      continued his education with coursework in Orthodontics and Fixed Prosthesis (2014).
      </p>
      <p>
      He now continues his career in the city of Tijuana, where he currently resides and practices,
      having helped over 350 people smile again; in Baja Smile Dentistry, he takes the time to teach
      each patient how to care for themselves in order to prevent disease and have the best health possible.
      </p>
    }
  },
  {
    date_of_birth: Date.parse("28/02/1991"),
    name: "Marcia Bustamante",
    payload: payload(File.read('./db/seeds/images/marcia-bustamante.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE,
    biography: %{
      <h5>Autonomous University of Baja California</h5>
      <h6>Doctor of Dental Surgery Degree (2004-2009)</h6>
      <hr/>
      <p>
      Doctor Marcia Bustamante studied at the Autonomous University of Baja California where she earned her
      Doctor of Dental Surgery Degree, and then continued her studies at El Bosque University, Colombia, in 2012,
      and in Nova Southeastern University, Fort Lauderdale, Florida, in 2013. Then she earned her Master’s Degree
      in Endodontics at the Autonomous University of Tlaxcala in 2012.
      </p>
    }
  },
  {
    date_of_birth: Date.parse("01/01/1984"),
    name: "Aldo Sanchez",
    payload: payload(File.read('./db/seeds/images/aldo-sanchez.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE,
    biography: %{
      <h5>Autonomous University of Guadalajara</h5>
      <h6>Doctor of Dental Surgery Degree (1997-2002)</h6>
      <hr/>
      <p>
      Doctor Aldo Sanchez was born in Culiacán, Sinaloa. He studied at the Autonomous University of Guadalajara,
      where he earned his Doctor of Dental Surgery Degree in 2002. Dr. Sanchez continued his education in 2005,
      achieving his Master’s Degree in Periodontics and Oral Implantology in 2006. He was the founder of the Periodontics
      Association of Sinaloa in 2006.
      </p>
      <p>
      Nowadays, he resides and practices in the city of Tijuana, where he has helped hundreds of people to get back their smile.
      </p>
    }
  },
  {
    date_of_birth: Date.parse("16/02/1975"),
    name: "Salvador Vizcaino",
    payload: payload(File.read('./db/seeds/images/salvador-vizcaino.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
    date_of_birth: Date.parse("04/08/1974"),
    name: "Verenice Orduno",
    payload: payload(File.read('./db/seeds/images/verenice-orduno.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
    date_of_birth: Date.parse("16/04/1964"),
    name: "Yván Rodríguez",
    payload: payload(File.read('./db/seeds/images/yvan-rodriguez.jpg')),
    primary_kind: :PRODUCER,
    status: :ACTIVE
  },
  {
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
    date_of_birth: Date.parse('01/01/2000'),
    city: 'San Diego',
    country_code: 'US',
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
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '22045',
    testimonial: {
      date: Date.parse('01/01/2015'),
      text: 'I can smile again. I had a quality work done here; they’re very clean and very professional. I recommend them a 100% Clean, good work, I’m very happy.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/oGvSov_LFLc',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/willey-stanley.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
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
      date: Date.parse('01/01/2015'),
      text: 'I felt discomfort in a molar piece, they did 2 extractions and I’m in the process of putting on crowns and making a new bridge.
      My experience has been very good, with all the staff. The doctor is very patient, he takes the time to explain what we need, he is very honest and he is very kind and conscious of us as patients and from our pockets.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'crowns'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        },
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('01/01/2000'),
    city: 'San Diego',
    country_code: 'US',
    extension: nil,
    name: 'Adela Todd',
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
      date: Date.parse('01/01/2015'),
      text: 'Awesome job, he did a deep cleaning and a composite filling in my molar, it was fast and easy Dr.Irving to do, I feel comfortable with him, and now I’m feeling great.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/adela-t.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Paulina Vizcaino',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'mr@microsoft.com',
    payload: payload(File.read('./db/seeds/images/paulina-vizcaino.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      date: Date.parse('01/01/2015'),
      text: 'Great Orthodontist! Everyone is so pleasant and professional, they care about you and make you feel safe. I recommend 100% Baja Smile Dentistry',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'orthodontics'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/paulina-vizcaino.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
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
      date: Date.parse('01/01/2015'),
      text: 'I feel very comfortable with my new dental bridge, they treated my very well and were very kind, I would recommend Baja Smile Dentistry to my friends.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'dental_implants'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/benjamin-orozco.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Maria Rivera',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'marierivera@microsoft.com',
    payload: payload(File.read('./db/seeds/images/maria-rivera.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja California',
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      date: Date.parse('01/01/2015'),
      text: 'Im very grateful with Dr. Irving, I’m happy with my dental work and I would totally recommend Baja Smile Dentistry to my family.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'dental_implants'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/maria-rivera-before.jpg')),
          title: 'titulo imagen'
        },
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/maria-rivera-after.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('01/01/2000'),
    city: 'Los Angeles',
    country_code: 'US',
    extension: nil,
    name: 'Carlos Trujillo',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'carlost@microsoft.com',
    payload: payload(File.read('./db/seeds/images/carlos-trujillo-after.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: "California",
    status: :ACTIVE,
    zip_postal_code: '99000',
    testimonial: {
      date: Date.parse('01/01/2015'),
      text: 'My wife came here four months ago and they did great work on her, so I came to Baja Smile Dentistry too, they are very professional and treated me very well.',
      rating: nil,
      source: :INTERNAL,
      status: :ACCEPTED,
      url: nil,
      item_keys: [
        'dental_implants'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/carlos-trujillo-before.jpg')),
          title: 'titulo imagen'
        },
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/carlos-trujillo-after.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
},
{
  date_of_birth: Date.parse('01/01/2000'),
  city: 'Los Angeles',
  country_code: 'US',
  extension: nil,
  name: 'Christian Leon',
  label: 'Home',
  number: '6197854545',
  line_1: 'Street 78',
  line_2: 'Apt b',
  line_3: nil,
  address: 'christianleon@microsoft.com',
  payload: payload(File.read('./db/seeds/images/christian-leon.jpg')),
  primary_kind: :CONSUMER,
  state_province_county: "California",
  status: :ACTIVE,
  zip_postal_code: '99000',
  testimonial: {
    date: Date.parse('28/02/2019'),
    text: 'I am doing brackets; they’re fixing to get implants. My experience in the clinic is that they do a very good job. It’s a good clinic. I like how they work and the experience with my brackets.
    The doctors are nice here, they do a very good job and I like how they work. I would definitely recommend this clinic for other patients. Good being here, and really good.',
    rating: nil,
    source: :INTERNAL,
    status: :ACCEPTED,
    url: nil,
    item_keys: [
      'orthodontics'
    ],
    images: [
      {
        description: 'description image',
        payload: payload(File.read('./db/seeds/images/christian-leon.jpg')),
        title: 'titulo imagen'
      }
    ]
  }
},
{
  date_of_birth: Date.parse('01/01/2000'),
  city: 'Los Angeles',
  country_code: 'US',
  extension: nil,
  name: 'Robin Imel',
  label: 'Home',
  number: '6197823545',
  line_1: 'Street 78',
  line_2: 'Apt b',
  line_3: nil,
  address: 'robinimel@microsoft.com',
  payload: payload(File.read('./db/seeds/images/robin-imel.jpg')),
  primary_kind: :CONSUMER,
  state_province_county: "California",
  status: :ACTIVE,
  zip_postal_code: '99000',
  testimonial: {
    date: Date.parse('28/02/2019'),
    text: 'Hi I’m Robin, I live in california. I just visited Baja Smile Dentistry, Irving was my dentist and I’m very pleased.
    They gave me a crown and everything went very smooth; I would definitely recommend them. They were really friendly and really helpful.',
    rating: nil,
    source: :INTERNAL,
    status: :ACCEPTED,
    url: nil,
    item_keys: [
      'dental_implants'
    ],
    images: [
      {
        description: 'description image',
        payload: payload(File.read('./db/seeds/images/robin-imel.jpg')),
        title: 'titulo imagen'
      }
    ]
  }
},
{
  date_of_birth: Date.parse('01/01/2000'),
  city: 'Tijuana',
  country_code: 'MX',
  extension: nil,
  name: 'Ivan Lima',
  label: 'Home',
  number: '6647894565',
  line_1: 'Street 78',
  line_2: 'Apt b',
  line_3: nil,
  address: 'ivanl@microsoft.com',
  payload: payload(File.read('./db/seeds/images/ivan-lima.jpg')),
  primary_kind: :CONSUMER,
  state_province_county: "Baja California",
  status: :ACTIVE,
  zip_postal_code: '99000',
  testimonial: {
    date: Date.parse('02/03/2019'),
    text: 'Hi, how are you? My name is Ivan. I want to recommend to you the clinic Baja Smile Dentistry. I’ve been doing very well in my Orthodontics Treatment, everything has been really cool, no pain, no trouble.
    Everyone is really helpful, believe me. A beautiful smile speaks for you. I really recommend you to come. Thanks.',
    rating: nil,
    source: :INTERNAL,
    status: :ACCEPTED,
    url: nil,
    item_keys: [
      'orthodontics'
    ],
    images: [
      {
        description: 'description image',
        payload: payload(File.read('./db/seeds/images/ivan-lima.jpg')),
        title: 'titulo imagen'
      }
    ]
  }
},
{
  date_of_birth: Date.parse('01/01/2000'),
  city: 'Tijuana',
  country_code: 'MX',
  extension: nil,
  name: 'Rosa Maria Rodriguez',
  label: 'Home',
  number: '6641514222',
  line_1: 'Street 718',
  line_2: 'Apt b',
  line_3: nil,
  address: 'rosamaria@microsoft.com',
  payload: payload(File.read('./db/seeds/images/rosamaria-rodriguez.jpg')),
  primary_kind: :CONSUMER,
  state_province_county: "Baja California",
  status: :ACTIVE,
  zip_postal_code: '22034',
  testimonial: {
    date: Date.parse('01/01/2015'),
    text: 'I got a root canal done. The job was fast. I got a root canal done before in another clinic and that time I felt stressed, but here I felt relaxed.
    The customer service is formidable: I was attended by a very nice lady, and the doctor is incredibly patient; he explained to me every detail of the treatment,
    and that for me, as a patient is very important, so I can know what he’s going to do, he gave me a lot of peace and I really felt comfortable and with really professional hands.
    I recommend you to come here. The attention is totally personalized. They give you the time you need to make you feel at home, many times attending your oral health is not easy,
    but with people like them, that makes you feel comfortable and relaxed it is a lot easier. Thank you very much.',
    rating: nil,
    source: :INTERNAL,
    status: :ACCEPTED,
    url: nil,
    item_keys: [
      'root_canal'
    ],
    images: [
      {
        description: 'description image',
        payload: payload(File.read('./db/seeds/images/rosamaria-rodriguez.jpg')),
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
      :address
    ).merge({
      emailable: consumer,
      confirmed: true
    })
  )
  email.save || binding.pry

  image = Image.new(
    attribute_set.slice(
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
    date_of_birth: Date.parse('01/01/2000'),
    city: 'San Diego',
    country_code: 'US',
    extension: nil,
    name: 'Willey Stanley',
    label: 'Home',
    number: '7602342345',
    line_1: 'Street 123',
    line_2: 'Apt b',
    line_3: nil,
    address: 'willeys@microsoft.com',
    payload: payload(File.read('./db/seeds/images/willey-stanley.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '22045',
    testimonial: {
      date: Date.parse('02/10/2018'),
      text: 'I can smile again, I have a quality work done here, they’re very clean and very professional. I recommend them a 100% Clean, good work, I’m very happy',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/oGvSov_LFLc',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/willey-stanley.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
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
      date: Date.parse('02/02/2019'),
      text: 'I had a discomfort in a molar piece, they did 2 extractions and I’m in the process of putting on crowns and making a new bridge.
      My experience has been very good, with all the staff. The doctor is very patient, he takes the time to explain what we need, he is very honest and he is very kind and conscious of us as patients and from our pockets.',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/4NsfsRun4_c',
      item_keys: [
        'crowns'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        },
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/isabel-juarez-before.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('15/02/2010'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Rosa Maria Rodriguez',
    label: 'Home',
    number: '6641517249',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'roxamaria0311@hotmail.com',
    payload: payload(File.read('./db/seeds/images/rosamaria-rodriguez.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja California',
    status: :ACTIVE,
    zip_postal_code: '22034',
    testimonial: {
      date: Date.parse('15/02/2019'),
      text: 'I got a root canal done, the job was fast, I got a root canal done before in another clinic and that time I felt stress, but here I felt relaxed.
      The customer service is formidable, I was attended by a very nice lady, and the doctor is incredibly patient, he explained to me every detail of the treatment, and that for me, as a patient is very important,
      so I can know what he’s going to do, he gave me a lot of peace and I really felt comfortable and in really professional hands. I recommend you to come here, the attention is totally personalized,
      they give you the time you need to make you feel at home, many times attending your oral health is not easy, but with people like them, that makes you feel comfortable and relaxed it is a lot easier. Thank you very much.',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/WMsq9J3ICMY',
      item_keys: [
        'root_canal'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/rosamaria-rodriguez.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('15/02/2010'),
    city: 'Los Angeles',
    country_code: 'US',
    extension: nil,
    name: 'Robin Imel',
    label: 'Home',
    number: '6197854598',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'robinimel@hotmail.com',
    payload: payload(File.read('./db/seeds/images/robin-imel.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '22034',
    testimonial: {
      date: Date.parse('28/02/2019'),
      text: 'Hi I’m Robin, I live in california. I just visited Baja Smile Dentistry, Irving was my dentist and I’m very please,
      they gave me a crown and everything went very smooth, I would definitely recommend them, they were really friendly and really helpful.',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/F261O5P0JTE',
      item_keys: [
        'dental_implants'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/robin-imel.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('15/02/2010'),
    city: 'Tijuana',
    country_code: 'MX',
    extension: nil,
    name: 'Ivan Lima',
    label: 'Home',
    number: '6197854598',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'ivanlima@hotmail.com',
    payload: payload(File.read('./db/seeds/images/ivan-lima.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'Baja  California',
    status: :ACTIVE,
    zip_postal_code: '22034',
    testimonial: {
      date: Date.parse('02/03/2019'),
      text: 'Hi, how are you? My name is Ivan I want to recommend you the clinic Baja Smile Dentistry, I’ve been doing very well in my Orthodontics Treatment,
      everything has been really cool, no pain, no troubles, everyone is really helpful, believe me, a pretty smile speaks for you. I really recommend you to come. Thanks.',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/gw8G6ssQHMw',
      item_keys: [
        'orthodontics'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/ivan-lima.jpg')),
          title: 'titulo imagen'
        }
      ]
    }
  },
  {
    date_of_birth: Date.parse('11/03/1964'),
    city: 'Los Angeles',
    country_code: 'US',
    extension: nil,
    name: 'Christian Leon',
    label: 'Home',
    number: '6197854848',
    line_1: 'Street 423',
    line_2: 'Apt b',
    line_3: nil,
    address: 'chrisitianleon@hotmail.com',
    payload: payload(File.read('./db/seeds/images/christian-leon.jpg')),
    primary_kind: :CONSUMER,
    state_province_county: 'California',
    status: :ACTIVE,
    zip_postal_code: '22034',
    testimonial: {
      date: Date.parse('16/02/2019'),
      text: 'I am doing brackets they’re fixing to get implants. My experience in the clinic is they do a very good job, It’s a good clinic, I like how they work and the experience with my brackets.
      The doctor are nice here, they do a very good job and I like how they work. I would definitely recommend this clinic for other patients, good being here, and really good.',
      rating: 5,
      source: :EXTERNAL,
      status: :ACCEPTED,
      url: 'https://www.youtube.com/embed/j8KR0JL6BWY',
      item_keys: [
        'root_canal'
      ],
      images: [
        {
          description: 'description image',
          payload: payload(File.read('./db/seeds/images/christian-leon.jpg')),
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
      :address
    ).merge({
      emailable: consumer,
      confirmed: true
    })
  )
  email.save || binding.pry

  image = Image.new(
    attribute_set.slice(
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

[
  {
    author: Person.where(
      primary_kind: :PRODUCER
    ).last,
    status: :PUBLISHED,
    title: 'Test Post 1',
    content: %{
      High season in Los Algodones it´s about to begin, this means that it´s time to start planning your dental vacation.
      Today, we would like to share with you some useful tips that every traveler will find extremely necessary, especially if this is their first time traveling to sunny Mexico.
      Before starting, we would like to give you an extra (and very important advice) don´t be nervous! Traveling outside your city of residence in order to undergo any kind of dental or medical treatment is very popular nowadays, and the results will be better than what you´re expecting, especially if you choose the right place. <a href="/posts/1">Read More</a>
    },
    published_at: 1.week.ago,
    images: [
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      }
    ]
  },
  {
    author: Person.where(
      primary_kind: :PRODUCER
    ).last,
    status: :PUBLISHED,
    title: 'Test Post 1',
    content: %{
      Getting dental work outside of your country of residence can be a little overwhelming sometimes, especially if you don’t know where to go.
      We’re sure you’ve heard of Los Algodones, Mexico also known as Molar City, the capital of dental tourism.
      But you might not know why it is the best place to get dental work done, right? We invite you to keep reading, we’ll give you some reasons to visit Los Algodones.<a href="/posts/1">Read More</a>
    },
    published_at: 2.week.ago,
    images: [
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      }
    ]
  },
  {
    author: Person.where(
      primary_kind: :PRODUCER
    ).last,
    status: :PUBLISHED,
    title: 'Test Post 1',
    content: %{
      Have you ever looked at someone and noticed that their smile is perfect just for the fact that their teeth are perfectly aligned?
      People with crooked teeth tend to compare their smiles to other people´s, and it´s ok.
      Who wouldn´t want a perfect smile, right? <a href="/posts/1">Read More</a>
    },
    published_at: 3.week.ago,
    images: [
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      },
      {
        description: 'Test Image',
        title: 'Test Image',
        payload: payload(File.read('./db/seeds/images/irving-cota.jpg'))
      }
    ]
  }
].each do |post_attribute_set|
  post = Post.new(post_attribute_set.except(:images))
  post.save || binding.pry

  post_attribute_set.fetch(:images).each do |image_attribute_set|
    image = Image.new(image_attribute_set.merge({imageable: post}))
    image.save || binding.pry
  end

  post.primary_image = post.images.first
  post.save || binding.pry
end
