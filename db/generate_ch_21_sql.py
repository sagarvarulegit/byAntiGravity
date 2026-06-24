import json

# Setup variables
subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'
sequence_number = '21'
chapter_title = 'Chapter 21: Globalisation and the Indian Economy'
base_chapter_uuid = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389210'
base_lesson_uuid = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389210'
base_quiz_uuid = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210'

# Define questions
questions = [
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd389211",
        "question_text": "Which of the following is the main reason why MNCs set up offices and factories in developing countries like India?",
        "options": [
            "A. To support local producers and workers",
            "B. To escape environmental regulations in developed nations",
            "C. To obtain cheap labour and other resources to lower production costs",
            "D. To build goodwill with foreign governments"
        ],
        "correct_option_index": 2
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd389212",
        "question_text": "When did the Indian government introduce major policy changes to remove barriers to foreign trade and foreign investment (liberalisation)?",
        "options": [
            "A. 1947",
            "B. 1971",
            "C. 1991",
            "D. 2001"
        ],
        "correct_option_index": 2
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd389213",
        "question_text": "What is the primary aim of the World Trade Organisation (WTO)?",
        "options": [
            "A. To regulate financial loans to developing countries",
            "B. To liberalise international trade by removing trade barriers",
            "C. To govern political disputes between sovereign nations",
            "D. To promote environmental protection and carbon tax laws"
        ],
        "correct_option_index": 1
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd389214",
        "question_text": "Special Economic Zones (SEZs) are industrial zones set up by governments in India specifically to:",
        "options": [
            "A. Restrict the entry of foreign goods into the country",
            "B. Provide free housing and transport for unorganised sector workers",
            "C. Attract foreign companies to invest in India by offering world-class infrastructure and tax exemptions",
            "D. Promote agriculture and traditional handicrafts in rural areas"
        ],
        "correct_option_index": 2
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd389215",
        "question_text": "How did the removal of import barriers on capacitors in 2001 affect the small producer Ravi?",
        "options": [
            "A. He expanded his business and hired 50 more workers",
            "B. He collaborated with a large MNC and sold his units at high profits",
            "C. His main clients shifted to cheaper imports, forcing him to cut production and lay off workers",
            "D. He successfully exported capacitors to the US and Europe"
        ],
        "correct_option_index": 2
    }
]

# Generate Comic Recap ASCII Table
# Let's format the lines of the table to fit exactly 100 characters wide (including borders)
def make_line(content, speaker=""):
    # Prefix is "│ Priya: \"" or "│ Rahul: \"" or "│ " or "│ PANEL 1:"
    if speaker == "Priya":
        prefix = '│ Priya: "'
        suffix = '"'
    elif speaker == "Rahul":
        prefix = '│ Rahul: "'
        suffix = '"'
    elif speaker == "remember":
        prefix = '│ '
        suffix = ''
    else:
        prefix = '│ '
        suffix = ''
        
    line_start = prefix + content + suffix
    pad_len = 99 - len(line_start)
    return line_start + (" " * pad_len) + "│"

comic_table = [
    "┌" + ("─" * 98) + "┐",
    make_line("PANEL 1:"),
    make_line("Look at all these brands of shoes and juices, Rahul! The market has completely changed!", "Priya"),
    make_line("Absolutely! Before 1991, Indian roads only had Fiat and Ambassador cars. It's a new era!", "Rahul"),
    "├" + ("─" * 98) + "┤",
    make_line("PANEL 2:"),
    make_line("It's because of MNCs. They buy local brands, like Cargill bought Parakh Foods, to expand.", "Priya"),
    make_line("And technology helps. Containers cut shipping costs, and internet links Delhi to London!", "Rahul"),
    "├" + ("─" * 98) + "┤",
    make_line("PANEL 3:"),
    make_line("But what about workers like Sushila or small owners like Ravi? They lost security.", "Priya"),
    make_line("True! Globalisation must be fair. The government needs to enforce labour laws and protect", "Rahul"),
    make_line("workers' rights.", "Rahul"),
    "├" + ("─" * 98) + "┤",
    make_line("📌 REMEMBER THIS!"),
    make_line("Globalisation is driven by MNCs and enabled by IT, transport, and 1991 liberalisation. We must"),
    make_line("fight for fair rules so everyone shares the benefits!"),
    "└" + ("─" * 98) + "┘"
]

comic_recap_text = "\n".join(comic_table)

# Construct Markdown content
markdown_content = f"""# Chapter 21: Globalisation and the Indian Economy

## 1. 🎯 Chapter Goal
Understand the concept of globalisation and how Multinational Corporations (MNCs) integrate global production and markets. Analyse the factors enabling globalisation, such as technological advancements and liberalisation policies, and evaluate its multi-faceted impacts on consumers, small producers, and workers in the Indian economy.

## 2. 🪝 Hook
Next time you go shopping, look around the electronics and clothing stores. You see the latest global brands of mobile phones, sneakers, and beverages that were unheard of in India just two decades ago! Back then, the only passenger cars on Indian roads were the Ambassador and the Fiat. How did our markets transform so rapidly from a closed system to an explosion of global choice? Let's discover the forces of globalisation shaping our daily lives and economy!

## 3. 📖 Concept 1: Production Across Countries & Interlinking by MNCs
Until the middle of the twentieth century, production was largely organized within national borders. What crossed these borders were mainly raw materials, food products, and finished goods. Colonies like India exported raw materials and imported finished products, with trade serving as the primary channel connecting distant regions.

This dynamic changed dramatically with the rise of **[JARGON: Multinational Corporation (MNC) | A company that owns or controls production in more than one nation | Cargill Foods is an American MNC that expanded by purchasing Parakh Foods in India.]**. MNCs set up offices and factories for production in countries where they can secure cheap labour, raw materials, and other resources. This keeps their costs of production low and maximises their profits.

### Spreading of Production Globally
Production is organized in increasingly complex, globally dispersed ways. MNCs fragment their production processes into small stages across different nations to exploit specific local advantages:
- **Research & Design**: Often done in developed countries like the US, where advanced research centres exist.
- **Manufacturing**: Components are made in countries like China due to its low-cost manufacturing capabilities.
- **Assembly & Marketing**: Products are assembled in locations close to major consumer markets, such as Mexico and Eastern Europe.
- **Customer Care**: Handled in countries like India, which provides highly skilled, English-speaking youth and engineers at a fraction of the cost in developed nations.
- *Cost Savings*: Spreading production this way can save MNCs 50% to 60% of total production costs.

### How MNCs Interlink Production
MNCs establish control over production in foreign countries through several key routes:
1. **Joint Ventures / Collaborations**: Partnering with local companies. The local companies benefit from:
   - Additional capital for buying new machinery and expanding production.
   - Access to the MNC's latest manufacturing technology.
   - *Example*: Ford Motors partnered with Mahindra and Mahindra in India in 1995 to set up a massive plant near Chennai.
2. **Acquisition / Buying Local Companies**: This is the most common route. MNCs with huge financial resources buy established local brands to quickly gain market share and distribution networks.
   - *Example*: Cargill Foods (a giant US MNC) bought Parakh Foods, a reputed Indian edible oil brand with four refineries, becoming the largest edible oil producer in India.
3. **Contract Manufacturing / Placing Orders**: MNCs place orders with small, independent producers in developing countries for goods like garments, footwear, and sports equipment. The MNCs then sell these under their own brand names, dictating the price, quality, delivery, and labour conditions.
   - *Example*: Local women in Ludhiana stitching footballs, or garment exporters in Delhi producing shirts for Western brands.

By leveraging these strategies, MNCs exert a powerful influence on distant production nodes, interlinking widely dispersed economies.
- **[JARGON: Foreign Investment | Investment made by a multinational corporation (MNC) to buy assets such as land, buildings, or machinery in another country | Ford Motors investing Rs 1700 crore in 1995 to set up a plant near Chennai is a foreign investment.]** is the capital deployed by MNCs to purchase assets abroad in the hope of earning profits.

## 4. 📖 Concept 2: Factors Enabling Globalisation
Globalisation is the process of rapid integration or interconnection between countries. While trade has connected nations for centuries, the scale of integration today is unprecedented. This process is driven by three main enabling factors:

### 1. Rapid Advancements in Technology
Technology has acted as a primary catalyst for globalisation:
- **Transportation Technology**: The invention of shipping containers has revolutionized trade. Goods are packed in large containers that are transferred intact between ships, railways, trucks, and planes. This has drastically cut port handling costs, minimized cargo theft, and increased speed. Additionally, falling air transport costs have enabled high-value goods to be transported by air in bulk.
- **Information and Communication Technology (ICT)**: Telecommunications, computers, satellite communication, and the internet allow instantaneous sharing of data.
  - *Example*: A news magazine published for London readers can be designed and edited on computers in Delhi, transmitted via the internet, printed locally, and paid for instantly via e-banking.

### 2. Liberalisation of Foreign Trade and Investment Policy
Trade barriers are restrictions governments impose to regulate foreign trade.
- **[JARGON: Trade Barrier | A restriction set by a government on foreign trade, such as import taxes or import quotas, to regulate imports | A tax on imported Chinese toys is a trade barrier that makes imports more expensive.]** include import taxes and import quotas.
- **Post-Independence Barriers in India**: Following independence, the Indian government put strict barriers on foreign trade and investment to protect infant domestic industries (in 1950s-1960s) from foreign competition. Only essential imports (machinery, petroleum, fertilizers) were allowed.
- **The 1991 Policy Shift**: Around 1991, India initiated far-reaching economic reforms. The government decided that local producers were mature enough to compete globally. It believed competition would force domestic companies to improve the quality of their goods.
- **[JARGON: Liberalisation | The removal of barriers or restrictions set by the government on foreign trade and investment | In 1991, India removed trade barriers to allow foreign companies to set up factories and offices easily.]** allowed businesses to make free decisions regarding exports and imports.

### 3. World Trade Organisation (WTO)
The WTO is an international organisation initiated by developed countries to liberalise international trade. Currently, about 160 countries are members.
- **Role**: WTO establishes rules for global trade and monitors compliance to ensure free trade.
- **Criticism**: In practice, WTO negotiations are often unfair. Developed countries (like the US) have retained massive agricultural subsidies (enabling their farmers to dump cheap farm products globally), while forcing developing nations to remove their trade barriers and farm support.

## 5. 📖 Concept 3: Impact of Globalisation and the Struggle for Fair Globalisation
The impact of globalisation on the Indian economy has not been uniform. It has created winners and losers:

### The Winners (Positive Impacts)
- **Urban Consumers**: The wealthy urban middle and upper classes have gained immensely. They enjoy a wider choice of goods, superior quality, and lower prices (e.g., cell phones, electronics, fast food), leading to a higher standard of living.
- **MNCs and Large Indian Companies**: MNC investments in India have risen, creating new jobs. Large Indian companies (like Tata Motors, Infosys, Ranbaxy, Asian Paints) upgraded their technology, improved standards, and even emerged as MNCs themselves.
- **Service Providers (IT Sector)**: Indian companies offering services like software development, data entry, call centres, accounting, and engineering have seen explosive export growth.

### Government Incentives for Investment
To attract foreign capital, Indian state and central governments use two main strategies:
- **[JARGON: Special Economic Zone (SEZ) | An industrial zone with world-class facilities set up by the government to attract foreign companies, offering tax exemptions for an initial period | The Indian government set up SEZs where companies do not have to pay taxes on production units for the first five years.]** are set up with world-class infrastructure (roads, electricity, water, storage). Companies in SEZs enjoy a tax holiday for the first five years.
- **Labour Law Flexibility**: To reduce labour costs, the government allows companies to bypass labour protection laws. Instead of regular contracts, companies hire workers on a "flexible," temporary basis during peak seasons.

### The Losers (Negative Impacts)
- **Small Manufacturers**: Small-scale industries employing millions (second only to agriculture) have been hit hard by cheap imports and MNC competition.
  - *Example (Ravi's Story)*: Ravi started a capacitor manufacturing unit in Hosur in 1992. When import barriers on capacitors were removed under WTO rules in 2001, television manufacturers began importing cheaper capacitors from abroad (at half the price). Ravi had to lay off workers and reduce production, while many of his peers closed down completely. Similar crises hit toys, tyres, plastics, dairy, and vegetable oil sectors.
- **Workers and Job Insecurity**: Globalisation has degraded labour rights. Exporters cut costs by hiring temporary workers, denying them benefits (provident fund, health insurance, overtime).
  - *Example (Sushila's Story)*: Sushila, a garment worker in Delhi, lost her permanent job. She now works as a temporary worker 30 km away, working 14-hour days, 7 days a week, earning half her previous wage with zero job security.

### The Struggle for Fair Globalisation
Since globalisation is a reality, the goal is to make it fair. **Fair Globalisation** ensures that benefits are shared equitably and opportunities are created for all.
- **Role of Government**:
  - Properly enforce labour laws to protect workers' rights.
  - Support small producers with credit and technology until they are strong enough to compete.
  - Use trade barriers and quotas strategically when necessary.
  - Collaborate with other developing nations at the WTO to challenge the dominance of developed countries.
- **Role of People**: Mass public campaigns, trade unions, and civil society groups have successfully protested unfair WTO policies, proving that citizens have a voice in shaping global trade rules.

## 6. ⚠️ Common Mistakes
- **Confusing Foreign Trade and Foreign Investment**: Foreign trade is the movement of goods and services across national borders (sellers reaching global buyers). Foreign investment is capital spent by MNCs to purchase physical assets (land, machinery) to set up production in another country.
- **Assuming Globalisation Benefits Everyone Equally**: Many students write that globalisation is purely positive. You must explain the unequal impact: it benefits urban consumers and MNCs, but causes job insecurity for workers and drives small local businesses to ruin.
- **Thinking India Liberalised Immediately After Independence**: India actually adopted protectionism in 1947 to shield its young industries. Liberalisation was only adopted in 1991 due to an economic crisis.

## 7. 💡 Memory Tricks
- **"T-I-L-E" Mnemonic**: Remember the drivers of globalisation:
  - **T** - Technology (Containers & IT)
  - **I** - International Organisations (WTO)
  - **L** - Liberalisation (1991 reforms)
  - **E** - Expansion of MNCs
- **Ravi vs. Cargill**: Remember Ravi as the small local producer of "dry capacitors" who got burned by imports, while Cargill is the massive "cargo ship" of wealth that swallowed local Parakh Foods.
- **SEZ = Special Zone**: Think of it as a "VIP Lounge" for foreign companies, offering free electricity, tax holidays, and relaxed rules (flexible labour).

## 8. 📝 Quick Practice
- **Question 1**: Explain how MNCs coordinate production across different countries.
  - *Answer*: MNCs coordinate production in three main ways:
    1. By setting up joint ventures with local companies (e.g., Ford collaborating with Mahindra).
    2. By buying local companies and leveraging their existing marketing networks (e.g., Cargill buying Parakh Foods).
    3. By placing orders with small producers for goods like garments and footwear, then selling them under the MNC's brand name.
- **Question 2**: What is a trade barrier? Why did the Indian government put trade barriers after Independence, and why were they removed in 1991?
  - *Answer*: A trade barrier is a restriction, such as a tax on imports, used by governments to regulate foreign trade.
    - **Post-Independence**: Barriers were set up to protect domestic industries from foreign competition when they were just starting in the 1950s-1960s.
    - **In 1991**: The government removed barriers because it believed domestic producers were strong enough to compete globally, and competition would drive them to improve quality and efficiency.

## 9. 🎓 Board Tips
- In questions regarding the "impact of globalisation," always present a balanced answer. Discuss both positive impacts (better consumer choice, growth of large Indian MNCs, SEZs) and negative impacts (loss for small capacitor/toy makers, insecure jobs for garment workers).
- Define "Special Economic Zones (SEZs)" and "Liberalisation" exactly. Do not use vague language; use key terms like "world-class facilities," "tax holidays," and "removal of trade barriers."
- Underline or highlight key case studies from the NCERT text in your answers: Cargill buying Parakh Foods, Ford Motors in Chennai, and the stories of Ravi (capacitors) and Sushila (garments).

## 10. 🔄 One-Minute Revision
- Globalisation is the rapid integration of countries through trade and investment, dominated by MNCs.
- MNCs minimize costs by fragmenting and spreading production across countries with local advantages (China for manufacturing, India for customer care).
- Transportation technology (containers) and ICT (internet, e-banking) are primary technological drivers of globalisation.
- India shifted to liberalisation in 1991, removing trade barriers to expose domestic producers to global competition.
- The WTO aims to liberalise trade but is criticized for allowing developed nations to maintain unfair trade barriers.
- Globalisation has created an uneven landscape, benefiting consumers and large companies but displacing small producers and creating job insecurity.

## 11. 🎬 Comic Recap
{comic_recap_text}"""

# Escape single quotes for SQL insertion
sql_escaped_notes = markdown_content.replace("'", "''")

# Create raw SQL content
sql_content = f"""-- Seeding Chapter 21: Globalisation and the Indian Economy

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('{base_chapter_uuid}', '{subject_id}', '{chapter_title}', {sequence_number}, 'Understand the integration of markets and production by MNCs, the factors enabling globalisation, and its multi-faceted impacts on the Indian economy.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('{base_lesson_uuid}', '{base_chapter_uuid}', 'Revision Notes: Globalisation and the Indian Economy', 'note', NULL, NULL,
'{sql_escaped_notes}', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('{base_quiz_uuid}', '{base_chapter_uuid}', 'Quiz: Globalisation and the Indian Economy', 60)
ON CONFLICT (id) DO NOTHING;
"""

for q in questions:
    options_json = json.dumps(q["options"])
    # Escape single quotes in JSON string
    options_json_escaped = options_json.replace("'", "''")
    # Escape question text if needed (no single quotes here, but good practice)
    question_text_escaped = q["question_text"].replace("'", "''")
    
    sql_content += f"""
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('{q["id"]}', '{base_quiz_uuid}', '{question_text_escaped}', 'multiple_choice', '{options_json_escaped}', {q["correct_option_index"]}, NULL, 1)
ON CONFLICT (id) DO NOTHING;
"""

# Write to target file
with open('/home/sagarv/Projects/byAntiGravity/db/temp_ch_21.sql', 'w', encoding='utf-8') as f:
    f.write(sql_content)

print("SUCCESS")
