-- CBSE Class 10 Learning Portal English Language & Literature (Code 184) Seed Data
-- Generated via Python compiler to ensure data integrity and avoid SQL truncation

-- 1. INSERT SUBJECT
INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES 
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'English Language & Literature', 'ENG10', 'Reading Comprehension, Grammar, Creative Writing & Literature — Code 184', 'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500&auto=format&fit=crop&q=60') 
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES 
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 1: A Letter to God', 1, 'Explore faith in God, humanity, and post office irony in G.L. Fuentes'' story.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 2: Nelson Mandela: Long Walk to Freedom', 2, 'Mandela''s journey, the struggle against apartheid, and the meaning of true freedom.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 3: Two Stories about Flying', 3, 'His First Flight by Liam O''Flaherty & The Black Aeroplane by Frederick Forsyth.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 4: From the Diary of Anne Frank', 4, 'Insight into a young girl''s life during the Nazi occupation through her diary entries.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 5: Glimpses of India', 5, 'A Baker from Goa, Coorg, and Tea from Assam — rich cultural narratives of India.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 6: Mijbil the Otter', 6, 'Gavin Maxwell''s journey of traveling and living with his playful pet otter, Mijbil.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 7: Madam Rides the Bus', 7, 'Valli''s first bus ride, representing her curiosity and induction into the mystery of life and death.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 8: The Sermon at Benares', 8, 'Gautama Buddha''s first sermon, exploring the inevitability of death and overcoming grief.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e09', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 9: The Proposal', 9, 'Anton Chekhov''s farcical play satirizing wealthy neighbors'' arguments over property and dogs.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e10', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 10: A Triumph of Surgery', 10, 'Tricki''s illness and recovery due to Dr. Herriot''s simple, common-sense treatment.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 11: The Thief''s Story', 11, 'Hari Singh''s reform through Anil''s trust, highlighting the power of education and kindness.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 12: The Midnight Visitor', 12, 'Ausable outwits the armed intruder Max through a clever fabrication of a balcony.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 13: A Question of Trust', 13, 'Horace Danby''s annual robbery turns sideways when he is tricked by another thief.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 14: Footprints without Feet', 14, 'Griffin, the brilliant but lawless scientist, misuses his invisibility discovery in London.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 15: The Making of a Scientist', 15, 'Richard Ebright''s journey of scientific inquiry, sparked by his childhood curiosity about butterflies.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 16: The Necklace', 16, 'Matilda Loisel''s ruined life after she loses a borrowed necklace, highlighting the danger of vanity.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 17: The Hack Driver', 17, 'A young lawyer''s search for Oliver Lutkins, who tricks him by pretending to be a friendly hack driver.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 18: Bholi', 18, 'Sulekha''s journey from a neglected simpleton to a confident, educated young woman who rejects a greedy groom.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e19', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 19: The Book That Saved the Earth', 19, 'A 25th-century play showing how a book of nursery rhymes stopped a Martian invasion in 2040.')
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT REVISION NOTES (LESSONS)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES 
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Revision Notes: A Letter to God', 'note', NULL, NULL, '# Chapter 1: A Letter to God

## Chapter Goal
The goal of this chapter is to understand the depth of unconditional faith, the irony of human situations, and how kindness from strangers can be misunderstood by a simple mind.

---

## 1. Summary
Lencho was a dedicated farmer whose livelihood depended entirely on his cornfield. He eagerly anticipated a rainstorm, which initially began as promised. However, the rain soon transformed into a devastating hailstorm, destroying his entire crop. 

Left with no hope, Lencho turned to his absolute faith in God. He wrote a letter to God requesting 100 pesos to sow his fields again. The postmaster, moved by Lencho''s innocent faith, decided to help. He collected money from his employees and friends, managing to raise 70 pesos. He signed it ''God'' and sent it. Upon receiving the letter, Lencho counted the money and was angry to find only 70 pesos. Believing that God could not make a mistake, he wrote another letter accusing the post office workers of stealing the remaining 30 pesos and calling them a "bunch of crooks."

---

## 2. Key Themes, Characters, and Plot Points
*   **Unwavering Faith**: Lencho''s faith in God is pure and unquestioning, representing a simple, rural worldview.
*   **Irony of Good Deeds**: The postmaster acts out of charity but is labeled a thief, showing how good intentions can yield unexpected labels.
*   **Characters**:
    *   **Lencho**: Hardworking, deeply religious, but suspicious of city dwellers.
    *   **Postmaster**: Generous, sensitive, and respectful of others'' beliefs.

---

## 3. Literary Devices Explained
*   [JARGON: Irony | A situation where the outcome is opposite to what was expected | Lencho calling the postmaster and staff a bunch of crooks after they selflessly collected money for him]
*   [JARGON: Metaphor | A comparison of two unrelated things by stating one is the other | Lencho comparing the large raindrops to new ten-cent coins and smaller ones to five-cent coins]
*   [JARGON: Personification | Giving human traits to non-human things | The wind blowing wildly like an angry force destroying the crops]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ A Letter to God — Faith and Irony                                                                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Lencho''s faith was so strong! He wrote directly to God asking for help."                 │
│ Rahul: "Yes, and the postmaster was so kind. He raised 70 pesos just to save Lencho''s faith."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But then Lencho called the postmaster and his staff a bunch of crooks! That''s so         │
│         unfair!"                                                                                 │
│ Rahul: "Exactly! That is the irony of the story. Lencho trusted God but doubted human            │
│         goodness."                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "It shows that sometimes blind faith makes us blind to the kindness of real people."      │
│ Rahul: "True. G.L. Fuentes masterfully highlights this conflict between faith and gratitude."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Faith can move mountains, but we must also recognize the helpers in front of us.                 │
│ The ultimate irony is that those who helped Lencho were blamed for stealing his money.           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Revision Notes: Nelson Mandela', 'note', NULL, NULL, '# Chapter 2: Nelson Mandela: Long Walk to Freedom

## Chapter Goal
The goal of this chapter is to comprehend the struggle against apartheid in South Africa, Mandela''s definition of true courage, and the realization that freedom comes with obligations to family and nation.

---

## 1. Summary
This chapter is an extract from Nelson Mandela''s autobiography. On May 10, 1994, democratic elections were held, and Mandela became South Africa''s first black President, ending three centuries of white minority rule. The inauguration ceremony in Pretoria was attended by politicians from over 140 countries.

Mandela paid tribute to the countless freedom fighters who sacrificed their lives. He reflected on how the decades of oppression produced great men of courage like Oliver Tambo and Walter Sisulu. He argued that courage is not the absence of fear, but the triumph over it. He also discussed the ''twin obligations'' of a man—one to his family, and one to his people and country. He noted that under apartheid, a black man attempting to fulfill his duty was ripped from his home, showing that freedom must be absolute for all citizens.

---

## 2. Key Themes, Characters, and Plot Points
*   **Oppression and Resilience**: Decades of apartheid created the character and strength of black South African leaders.
*   **Courage and Brotherhood**: True bravery is overcoming fear to fight for the common good.
*   **Characters**:
    *   **Nelson Mandela**: A visionary leader who walked the long path from prisoner to president, believing in the basic goodness of humanity.

---

## 3. Literary Devices Explained
*   [JARGON: Apartheid | A political system of racial segregation and discrimination | South Africa''s former government system that denied rights to non-whites]
*   [JARGON: Metaphor | A figure of speech comparing two things without using like or as | Calling the assembly of international dignitaries a rainbow gathering of different nations]
*   [JARGON: Synecdoche | A figure of speech where a part represents the whole | Mandela referring to his people''s hands and hearts working together to rebuild the nation]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Nelson Mandela — True Courage & Freedom                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Mandela says courage is not the absence of fear, but the triumph over it!"               │
│ Rahul: "Yes! And he speaks of the twin obligations—to our families and to our country."          │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But under apartheid, black South Africans weren''t allowed to fulfill their               │
│         obligations."                                                                            │
│ Rahul: "True. They were punished just for trying to live like human beings. The system was       │
│         brutal."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "Now, South Africa is free. But Mandela warns that the walk to true freedom is still      │
│         long."                                                                                   │
│ Rahul: "Right. To be free is to live in a way that respects and enhances the freedom of          │
│         others."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Courage is conquering fear, not just being fearless.                                             │
│ We have twin obligations: to our personal family and to our wider national family.               │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Revision Notes: Two Stories about Flying', 'note', NULL, NULL, '# Chapter 3: Two Stories about Flying

## Chapter Goal
The goal of this chapter is to understand the value of self-confidence and courage in overcoming fear, and the mystery of hope during desperate situations.

---

## 1. Summary
*   **Part I: His First Flight**: A young seagull is terrified of flying, unlike his brothers and sister. His parents threaten to let him starve on the ledge unless he flies. Driven mad by hunger after 24 hours, he watches his mother fly near with a fish. He dives for the food, falls into space, spreads his wings naturally, and conquers his fear.
*   **Part II: The Black Aeroplane**: The narrator is flying his old Dakota aeroplane from France to England. He encounters massive black storm clouds. Refusing to turn back, he flies into the storm. His instruments fail, and he loses radio contact. Suddenly, a mysterious black aeroplane appears, guiding him safely through the clouds. Upon landing, the control tower woman tells him that no other planes were in the sky, leaving him wondering who helped him.

---

## 2. Key Themes, Characters, and Plot Points
*   **Conquering Fear**: The young seagull''s story shows that fear is a mental barrier solved by action.
*   **Mystery and Hope**: The pilot''s story represents how the mind can project solutions (or finding helper figures) during crises.
*   **Characters**:
    *   **Young Seagull**: Timid, hungry, but ultimately a successful flyer.
    *   **Dakota Pilot**: Brave, determined, and deeply grateful.

---

## 3. Literary Devices Explained
*   [JARGON: Simile | A comparison of two things using ''like'' or ''as'' | The storm clouds described as standing like black mountains in front of the aeroplane]
*   [JARGON: Personification | Giving human qualities to non-human things | The sea calling out to the young seagull or the wind playing tricks on the plane]
*   [JARGON: Suspense | The state of excitement or anxiety about what may happen | The pilot''s tense experience when the fuel runs low in the storm]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Two Stories about Flying — Conquering Limits                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "The young seagull was so scared to fly! But hunger pushed him off the ledge."            │
│ Rahul: "Sometimes, fear is just a mental wall. Once he plunged, his wings spread naturally."     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And what about the pilot in the old Dakota? He survived a massive storm because of a     │
│         mystery helper."                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "The black aeroplane was like a guiding light. Was it real or his own inner strength?"    │
│ Priya: "Maybe both! It teaches us that hope helps us find a way out of the darkest storms."      │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Conquering fear requires taking the first plunge, even if you are forced to do so.               │
│ When facing a storm, self-reliance and hope are your ultimate navigation tools.                  │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Revision Notes: From the Diary of Anne Frank', 'note', NULL, NULL, '# Chapter 4: From the Diary of Anne Frank

## Chapter Goal
The goal of this chapter is to explore the emotional isolation of a young teenager, the power of diary writing as self-expression, and how humor can resolve classroom conflicts.

---

## 1. Summary
Anne Frank, a 13-year-old Jewish girl, felt lonely despite having family and friends because she lacked a true confidante. She decided to write a diary, naming it ''Kitty'', treating it as her closest friend. 

She shared stories of her school life, particularly her math teacher, Mr. Keesing. Annoyed by Anne''s talkative nature, he assigned her extra homework: writing essays on "A Chatterbox." Anne argued that talking is a female trait inherited from her mother. When Mr. Keesing assigned a third essay titled "Quack, Quack, Quack, Said Mistress Chatterbox," Anne wrote a humorous poem about three baby ducklings bitten to death by their father swan for quacking too much. Mr. Keesing took the joke in good spirit, read it to the class, and stopped punishing her.

---

## 2. Key Themes, Characters, and Plot Points
*   **Teenage Solitude**: The need to express oneself honestly is why Anne kept her diary.
*   **Teacher-Student Dynamic**: Mr. Keesing''s transition from strict educator to understanding mentor shows the power of humor.
*   **Characters**:
    *   **Anne Frank**: Witty, creative, talkative, and highly mature for her age.
    *   **Mr. Keesing**: Traditional math teacher who values discipline but appreciates wit.

---

## 3. Literary Devices Explained
*   [JARGON: Personification | Attributing human characteristics to abstract ideas | Anne''s famous quote: Paper has more patience than people]
*   [JARGON: Alliteration | The repetition of consonant sounds at the start of words | Anne writing about her homework being a test of her writing talents]
*   [JARGON: Irony | A contrast between expectations and reality | A teacher assigning a talking student an essay about talking, only to be outwitted by the essay''s contents]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Anne Frank — Writing as a Confidante                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Anne Frank felt she had no true friend, so she treated her diary as one."                │
│ Rahul: "Yes, she named it ''Kitty''. And she argued that ''paper has more patience than             │
│         people''!"                                                                                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And she was so witty! She outwitted her math teacher, Mr. Keesing, who punished her      │
│         for talking."                                                                            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "By writing a poem about baby ducklings and a father swan? That was hilarious!"           │
│ Priya: "It was. Mr. Keesing took the joke well and let her talk. Humor solved the conflict!"     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Writing is a powerful outlet for loneliness and self-expression.                                 │
│ A witty, humorous approach can resolve tension and win over strict authority figures.            │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Revision Notes: Glimpses of India', 'note', NULL, NULL, '# Chapter 5: Glimpses of India

## Chapter Goal
The goal of this chapter is to discover the rich cultural heritage, unique local traditions, and natural beauty of three different regions in India (Goa, Coorg, and Assam).

---

## 1. Summary
*   **Part I: A Baker from Goa**: A nostalgic look at traditional Goan village life under Portuguese influence. The baker (pader) was an important figure, and children loved the sweet ''bread-bangles''. The sound of his bamboo staff announced his arrival.
*   **Part II: Coorg**: A description of Coorg (Kodagu), a beautiful district in Karnataka known for coffee, spices, and rainforests. The local people are famous for their bravery, hospitality, and distinct Greek/Arabic descent.
*   **Part III: Tea from Assam**: Pranjol and Rajvir travel to Assam, the world''s tea capital. Rajvir shares tea legends (a Chinese emperor boiling leaves and a Buddhist monk growing tea from eyelids) and details the sprawling Dhekiabari tea estate.

---

## 2. Key Themes, Characters, and Plot Points
*   **Cultural Legacy**: The stories highlight how colonial influences (Portuguese in Goa, Greeks/Arabs in Coorg, British in Assam) shaped local practices.
*   **Nature and Hospitality**: The descriptions celebrate India''s natural wealth and traditions of hosting guests.
*   **Characters**:
    *   **Rajvir**: Curious and well-prepared traveler.
    *   **Pranjol**: Practical local student who takes tea gardens for granted.

---

## 3. Literary Devices Explained
*   [JARGON: Imagery | Descriptive language that creates vivid mental pictures | Descriptions of coffee estates with colonial bungalows and sprawling green tea bushes]
*   [JARGON: Nostalgia | A sentimental longing for the past | The Goan elders fondly remembering the Portuguese bread and baking furnaces]
*   [JARGON: Hyperbole | Exaggeration used for emphasis | Rajvir claiming that over eighty crore cups of tea are drunk daily throughout the world]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Glimpses of India — A Diverse Tapestry                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "India has such diverse landscapes—like the Goan baker, the Coorg warriors, and           │
│         Assam''s tea!"                                                                            │
│ Rahul: "Indeed! Goa retains its Portuguese baking traditions, and Coorg has Greek and Arabic     │
│         ancestry."                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And Assam produces the most tea in the world! Rajvir shared so many cool legends         │
│         about its origin."                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Yes, like the Buddhist monk who cut off his eyelids, and tea plants grew from them!"     │
│ Priya: "These glimpses show that our culture is defined by local heritage and natural            │
│         beauty."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ India''s strength lies in its regional diversity and deep-rooted cultural heritage.               │
│ Every region has unique stories, legends, and professions that define its identity.              │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Revision Notes: Mijbil the Otter', 'note', NULL, NULL, '# Chapter 6: Mijbil the Otter

## Chapter Goal
The goal of this chapter is to understand the unique bond between humans and wild pets, the responsibilities of domesticating an unusual animal, and the playful nature of otters.

---

## 1. Summary
Gavin Maxwell, living in Camusfearna, West Highlands of Scotland, decided to keep an otter as a pet after his dog died. He traveled to Iraq and was gifted an otter by local Arabs, naming him Mijbil. 

Maxwell spent weeks understanding Mijbil''s playful habits, including his love for running water and rolling in bathtubs. The main conflict occurs when Maxwell has to transport Mijbil to London. The airline required Mijbil to be kept in a box. Mijbil tore the box and injured himself. On the flight, he escaped, causing panic among passengers before being recovered by Maxwell. In London, Mijbil adjusted to city life, inventing games with ping-pong balls and walking on low walls, while Londoners struggled to guess what animal he was.

---

## 2. Key Themes, Characters, and Plot Points
*   **Domesticating Wild Animals**: The story shows that keeping an unusual pet requires high responsibility and specialized care.
*   **Playfulness and Intellect**: Mijbil''s behavior highlights the curiosity and intelligence of otters.
*   **Characters**:
    *   **Gavin Maxwell**: A compassionate and patient writer who respects his pet''s wild instincts.
    *   **Mijbil**: An active, intelligent, and highly affectionate otter.

---

## 3. Literary Devices Explained
*   [JARGON: Onomatopoeia | Words that imitate the sound they describe | The water sloshed and spluttered in the bathtub]
*   [JARGON: Anthropomorphism | Attributing human motives or characteristics to animals | Describing Mijbil''s intense focus on his toys as if he were a professional gamer]
*   [JARGON: Simile | Comparing two things using like or as | Describing the otter''s head as shaped like a small medieval dragon]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Mijbil the Otter — Unconventional Companionship                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Gavin Maxwell''s travel with Mijbil the otter was total chaos!"                           │
│ Rahul: "Especially on the aeroplane! Mijbil escaping the box and scaring the passengers."        │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But Gavin''s bond with Mijbil was so sweet. Mijbil was incredibly playful, like a         │
│         child."                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Yes, inventing games with ping-pong balls and walking on low walls in London."           │
│ Priya: "It shows that wild animals have deep emotions and require immense patience to raise."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Raising a pet, especially an unconventional one, is a serious, long-term responsibility.         │
│ Animals respond to patience, play, and genuine affection with loyalty and trust.                 │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Revision Notes: Madam Rides the Bus', 'note', NULL, NULL, '# Chapter 7: Madam Rides the Bus

## Chapter Goal
The goal of this chapter is to trace a child''s independent journey of self-discovery, understand how curiosity leads to mature experiences, and explore the concept of mortality through a child''s eyes.

---

## 1. Summary
Valliammai (Valli) was an 8-year-old girl who loved watching the street from her doorway. Her greatest desire was to travel on the bus that ran between her village and the nearest town. 

She planned her trip carefully, saving 60 paise by resisting candies, toys, and merry-go-rounds. She slipped out of her house during her mother''s afternoon nap. The jolly bus conductor joked and called her ''Madam'' because of her independent behavior. Valli was fascinated by the passing landscape, especially a young cow running ahead of the bus. However, on the return journey, she saw the same cow lying dead by the road, hit by a vehicle. The sight filled her with deep sadness and silence, making her realize the suddenness of death and the transition from life.

---

## 2. Key Themes, Characters, and Plot Points
*   **Loss of Innocence**: The dead cow represents Valli''s first encounter with death, shifting her perspective from childish joy to quiet reflection.
*   **Determination and Planning**: Valli''s self-discipline in saving money shows high maturity.
*   **Characters**:
    *   **Valli**: Observant, independent, self-respecting, and highly organized.
    *   **Conductor**: Friendly, humorous, and supportive of Valli''s adventure.

---

## 3. Literary Devices Explained
*   [JARGON: Irony | The contrast between expectations and reality | The cow that brought Valli laughter on the way to town was the source of her deepest sorrow on the way back]
*   [JARGON: Sarcasm | Humorous remarks used to mock or tease | The conductor referring to an eight-year-old traveler as a respectable ''Madam'']
*   [JARGON: Symbolism | An object or event representing a deeper meaning | The running cow symbolizing vibrant life, and its sudden death representing the fragile nature of human existence]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Madam Rides the Bus — Innocence & Maturity                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Valli was so young, only 8! But she planned and executed her bus trip like a pro."       │
│ Rahul: "Yes, saving 60 paise was a big deal. But her return journey was so sad."                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "Seeing that beautiful cow dead by the roadside really shook her, didn''t it?"             │
│ Rahul: "It did. It was her first real encounter with the harsh mystery of death."                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "She returned home silent. She went out as a curious child and came back matured."        │
│ Rahul: "That''s the journey of life. Experience teaches us the reality of existence."             │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Independent choices bring us face-to-face with the real world''s beauty and tragedies.            │
│ Maturity begins when we realize how fragile and unpredictable life and death are.                │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Revision Notes: The Sermon at Benares', 'note', NULL, NULL, '# Chapter 8: The Sermon at Benares

## Chapter Goal
The goal of this chapter is to understand the core Buddhist philosophy on the universality of death, the nature of suffering, and how acceptance brings peace of mind.

---

## 1. Summary
Siddhartha Gautama, born a prince in Northern India, was shielded from the world''s sufferings. At twenty-five, he chanced upon a sick man, an aged man, a funeral procession, and a begging monk. Deeply moved, he renounced his royalty to seek enlightenment. He sat under a peepal tree and achieved wisdom, becoming the Buddha. 

He preached his first sermon at Benares. Kisa Gotami, grieving the death of her only son, went door-to-door asking for medicine to revive him. Buddha instructed her to procure a handful of mustard seeds from a house where no one had lost a loved one. Kisa Gotami went to many houses but could not find a single home untouched by death. She realized that death is common to all, and that her grief was selfish. She understood that holding onto sorrow only increases physical and mental pain, and peace comes from acceptance.

---

## 2. Key Themes, Characters, and Plot Points
*   **Universality of Death**: Grieving cannot change mortality; everyone who is born must die.
*   **Grief and Detachment**: Overcoming pain requires letting go of attachment and lamentation.
*   **Characters**:
    *   **Gautama Buddha**: Compassionate teacher who guides Kisa Gotami to self-realization rather than lecturing her.
    *   **Kisa Gotami**: A loving mother blinded by grief who achieves spiritual peace through a simple exercise.

---

## 3. Literary Devices Explained
*   [JARGON: Parable | A simple story used to illustrate a moral lesson | Buddha using Kisa Gotami''s quest for mustard seeds to teach the reality of death]
*   [JARGON: Analogy | A comparison between two things for explanation | Buddha comparing mortal lives to ripe fruits that are in danger of falling, and earthen vessels made by a potter that eventually break]
*   [JARGON: Metaphor | A figure of speech comparing two things without like/as | Describing the world as afflicted with death and decay]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ The Sermon at Benares — Overcoming Grief                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Kisa Gotami''s grief for her dead son was so painful. She couldn''t accept his death."     │
│ Rahul: "Yes, but the Buddha didn''t just tell her to stop crying. He gave her a task."            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "To find mustard seeds from a house where no one had died! And she found none."           │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Exactly. She realized that death is common to all. Grieving only increases our own       │
│         pain."                                                                                   │
│ Priya: "Accepting loss is the only way to find peace of mind. It''s a deep lesson."               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Death is an inevitable, natural law that touches every single household.                         │
│ Selfish grieving or lamentation cannot change reality; peace comes only from acceptance.         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e09', 'Revision Notes: The Proposal', 'note', NULL, NULL, '# Chapter 9: The Proposal

## Chapter Goal
The goal of this chapter is to analyze Anton Chekhov''s satire on marriage, understand how material greed and pride overshadow relationships, and identify farcical character behaviors.

---

## 1. Summary
Lomov, a 35-year-old hypochondriac neighbor, arrives at Chubukov''s house dressed formally to propose marriage to Chubukov''s daughter, Natalya. Chubukov is delighted, assuming Lomov wants a loan, but gladly calls Natalya.

However, Lomov starts by talking about his historical property, "Oxen Meadows." Natalya heatedly claims the land belongs to her family. A massive argument ensues, with Chubukov joining in. Lomov has palpitations and leaves in a huff. When Natalya finds out he came to propose, she demands he return. Lomov comes back, but they immediately start a second argument about the superiority of their hunting dogs (Lomov''s Guess vs. Natalya''s Squeezer). Lomov faints from stress. Fearing he is dead, Chubukov panics. When Lomov revives, Chubukov quickly joins their hands, forces them to kiss, and declares them engaged. They immediately resume arguing.

---

## 2. Key Themes, Characters, and Plot Points
*   **Satire on Upper-Class Marriage**: Marriage is treated as a business deal to join properties, not a romantic union.
*   **Petty Pride**: The characters choose trivial arguments over a life-altering proposal.
*   **Characters**:
    *   **Lomov**: Highly nervous, hypochondriac, and argumentative.
    *   **Natalya**: Shrewd, possessive of property, and desperate to marry.
    *   **Chubukov**: Opportunistic father who only cares about social status and wealth.

---

## 3. Literary Devices Explained
*   [JARGON: Farce | A comedy marked by exaggerated characters and absurd situations | Lomov fainting from palpitations while Natalya screams at him about dogs]
*   [JARGON: Satire | Mocking human vices or foolishness through humor | Chekhov mocking the superficiality of high-society marriages]
*   [JARGON: Irony | The contrast between expectations and reality | Lomov coming to propose a lifetime union but spending his entire visit arguing]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ The Proposal — Satire on High Society                                                            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Lomov came to propose to Natalya, but they fought over Oxen Meadows and dogs!"           │
│ Rahul: "I know! The proposal was completely forgotten while they screamed at each other."        │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And Chubukov, instead of calming them, joined in the shouting match!"                    │
│ Rahul: "Farcical! Lomov was fainting from palpitations, yet they couldn''t stop arguing."         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "Even after getting engaged at the end, they started fighting again!"                     │
│ Rahul: "Chekhov satirizes how upper-class marriages were just about property, not love."         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Property and petty pride should never take priority over relationships and marriage.             │
│ Anger management and active listening are crucial to avoid turning discussions into farces.      │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f90', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Writing Skills: Formal Letter Writing Template & Models', 'note', NULL, NULL, '# CBSE Class 10: Formal Letter Writing Guide

## 1. Structure of a Formal Letter (CBSE Format)
A formal letter is evaluated out of **5 marks** in the board examination. Adhering to the correct format is crucial.

1.  **Sender''s Address**: 2-3 lines, left-aligned. (Do not write your real name/address; use ''Examination Hall, City X'').
2.  **Date**: Write in full format, e.g., ''24 June 2026'' or ''June 24, 2026''.
3.  **Receiver''s Address**: Designations (e.g., ''The Editor'') followed by newspaper name and city.
4.  **Subject**: Concise (4-6 words), summarizing the purpose. Underline the subject.
5.  **Salutation**: Formal, e.g., ''Sir'' or ''Dear Sir/Madam''.
6.  **Body of the Letter**: Divided into three distinct paragraphs:
    *   **Paragraph 1 (Introduction)**: State the purpose of the letter.
    *   **Paragraph 2 (Detail)**: Elaborate on the issue, causes, effects, and consequences.
    *   **Paragraph 3 (Conclusion/Suggestion)**: Suggest remedies or raise awareness. (Note: For letters to the editor, do not ask the editor to solve the problem; ask him to publish the concern so authorities take action).
7.  **Complimentary Close**: ''Yours faithfully'' or ''Yours sincerely'' (Note the lowercase ''f'' and ''s''; no apostrophe in Yours).
8.  **Sender''s Name**: Write signature and name (e.g., ''XYZ'' or the name given in the question).

---

## 2. Standard Blank Template
```text
Sender''s Address:
[Examination Hall,
City X, India]

Date: [24 June 2026]

Receiver''s Address:
[The Editor,
The Daily Times,
New Delhi - 110001]

Subject: [Underlined concise summary of concern]

Sir,

Through the columns of your esteemed newspaper, I would like to draw the attention of the concerned authorities and the general public towards the rising issue of [Insert Topic].

[Detail paragraph discussing the reasons, consequences, and current public distress regarding the problem...]

It is hoped that this publication will awaken the authorities from their slumber so they take immediate steps to address the problem.

Yours faithfully,
[XYZ/Given Name]
```', TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f91', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Writing Skills: Analytical Paragraph Guide & Models', 'note', NULL, NULL, '# CBSE Class 10: Analytical Paragraph Writing Guide

## 1. Structure of an Analytical Paragraph
An analytical paragraph requires you to write a coherent summary based on a given map, chart, graph, table, or outline. It carries **5 marks**.

1.  **Title**: Give a suitable, descriptive title.
2.  **Introduction (1-2 sentences)**: Paraphrase the question prompt. State what the chart/graph represents.
    *   *Useful opening words*: ''The line graph illustrates...'', ''The bar chart depicts...'', ''The table compares...''
3.  **Body Paragraph (Data Comparison)**: Describe the trends, percentages, increases, decreases, and fluctuations. Group similar data together and compare values.
    *   *Useful vocab*: ''A sharp increase'', ''gradually declined'', ''hit a peak of'', ''remained steady'', ''in comparison to''.
4.  **Conclusion (1-2 sentences)**: Provide a summary of the overall trend or findings. Do not list specific figures here.
    *   *Useful opening words*: ''In conclusion, it is clear that...'', ''Overall, the data suggests that...''

---

## 2. Key Formatting Rules
*   **Word Limit**: 100-120 words. Keep it crisp.
*   **Tone**: Completely objective. Do not express personal opinions or suggestions.
*   **Tense**: Use present/past tense consistently based on the years mentioned in the prompt.', TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f92', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Writing Skills: Story Completion Guide & Models', 'note', NULL, NULL, '# CBSE Class 10: Story Completion Writing Guide

## 1. Elements of a Good Story
Story writing is a creative task evaluated out of **5 marks**. It tests imagination and language control.

1.  **Title**: Catchy and relevant to the plot.
2.  **Setting the Scene**: Start directly from the opening line given in the prompt, establishing an atmosphere (e.g. mysterious, cheerful, exciting).
3.  **Character Development**: Keep it to 1-2 characters to maintain focus in the short word limit.
4.  **Plot & Conflict**: Introduce an obstacle, surprise, or turning point.
5.  **Resolution & Conclusion**: Conclude with a logical resolution. An open or surprising ending is highly effective.
6.  **Moral (Optional)**: State the lesson at the end if appropriate.

---

## 2. Writing Tips
*   **Tense**: Write primarily in the past tense.
*   **Dialogue**: Include 1-2 lines of direct dialogue to bring characters to life.
*   **Word Limit**: 150-200 words.', TRUE, 2)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT POETRY QUIZZES AND QUESTIONS
-- 5. INSERT GRAMMAR QUIZZES AND QUESTIONS
-- 6. INSERT WRITING QUIZZES AND QUESTIONS
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES 
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Poem Quiz: Dust of Snow', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Poem Quiz: Fire and Ice', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Poem Quiz: A Tiger in the Zoo', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Poem Quiz: How to Tell Wild Animals', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Poem Quiz: The Ball Poem', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Poem Quiz: Amanda!', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Poem Quiz: The Trees', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Poem Quiz: Fog', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Poem Quiz: The Tale of Custard the Dragon', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Poem Quiz: For Anne Gregory', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Grammar Quiz: Tenses', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Grammar Quiz: Modals', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Grammar Quiz: Reported Speech', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Grammar Quiz: Subject-Verb Concord', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Grammar Quiz: Editing/Omission', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Writing Skills: Letter Writing Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Writing Skills: Analytical Paragraph Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Writing Skills: Story Completion Assessment', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) VALUES 
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

Who is the poet of the poem ''Dust of Snow''?', 'extract_based', '["Robert Frost", "William Wordsworth", "Leslie Norris", "Robin Klein"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What did the crow shake down on the poet?', 'extract_based', '["Dust of leaves", "Dust of snow", "Fruit seeds", "Raindrops"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0002', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What tree is mentioned in the extract, and what does it represent?', 'extract_based', '["Oak tree; strength", "Hemlock tree; poison and sorrow", "Banyan tree; longevity", "Pine tree; joy"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0003', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What effect did the dust of snow have on the poet''s mood?', 'extract_based', '["It made him angry.", "It changed his mood from depressed to uplifted.", "It made him feel cold.", "It had no effect."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0004', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

Which poetic device is used in the phrase ''shook down on me''?', 'extract_based', '["Alliteration", "Imagery", "Onomatopoeia", "Personification"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'How does a simple moment in nature change the poet''s perspective on his day? Discuss with reference to the poem ''Dust of Snow''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Dust of Snow', 'A simple natural event—a crow shaking snow off a hemlock tree onto the poet—shatters his depressive, brooding mood. The cold touch of the snow acts as a sudden wake-up call, making him realize that he was wasting his day in regret. Nature''s quiet beauty reminds him of the simple joy of being alive, saving the remainder of his day.', '1. Explain the initial depressed mood of the poet (1 mark)
2. Detail the action of the crow and the snow (1 mark)
3. Describe the change in perspective and saving of the day (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Analyze the symbolic significance of the crow and the hemlock tree in Robert Frost''s poem ''Dust of Snow''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Dust of Snow', 'Traditionally, the crow and the hemlock tree are symbols of ill omen, sorrow, and poison. By choosing these elements to bring joy and a positive change in the poet''s mood, Robert Frost subverts traditional romantic associations. He illustrates that nature, in all its forms, is a source of healing and that joy can emerge from seemingly negative symbols.', '1. Explain typical symbols of crow and hemlock (1 mark)
2. Describe how the poet uses them to bring positive change (1 mark)
3. State the underlying message of nature''s healing powers (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What does ''fire'' symbolize in the poem?', 'extract_based', '["Uncontrolled anger and heat", "Lust, greed, and desire", "Industrial progress", "Wars"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What does ''ice'' symbolize in the poem?', 'extract_based', '["Cold weather", "Scientific advancement", "Hatred and indifference", "Pure logic"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

According to the poet, what will cause the world''s destruction first?', 'extract_based', '["Desire and fire", "Hatred and ice", "Natural disasters", "Nuclear weapons"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

Who does the poet support in the first stanza?', 'extract_based', '["Those who favor ice", "Those who favor fire", "Those who believe the world is immortal", "No one"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What is the rhyme scheme of this extract?', 'extract_based', '["abab", "abaa", "abcb", "abba"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'How does Robert Frost compare human emotions to natural elements in ''Fire and Ice''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fire and Ice', 'Robert Frost compares intense human emotions to destructive natural forces. He equates ''fire'' with human desire, passion, and greed, noting its rapid, consuming destruction. He equates ''ice'' with hatred, coldness, and indifference, which slowly but completely numbs and destroys relationships and humanity. Both are capable of bringing the world to an end.', '1. Equate fire with passion/greed (1 mark)
2. Equate ice with hatred/indifference (1 mark)
3. Explain how both lead to destruction (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Explain the line ''From what I''ve tasted of desire / I hold with those who favor fire''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fire and Ice', 'In this line, the poet draws from his personal experiences of human desire, passion, and greed. He understands how these intense emotions can drive individuals to destructive conflicts and wars. Based on this understanding, he initially agrees that passion (fire) is the primary force that will lead to human self-destruction.', '1. Define the poet''s personal experience of desire (1 mark)
2. Link desire to conflict and destruction (1 mark)
3. Explain his support for the fire theory (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Where is the tiger in this extract?', 'extract_based', '["In a forest", "In a circus", "In a cage in a zoo", "On a mountain"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

What does the phrase ''pads of velvet quiet'' refer to?', 'extract_based', '["The tiger''s soft paws", "A carpet in the cage", "Grass in the jungle", "Quiet visitors"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0202', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Why is the tiger in a state of ''quiet rage''?', 'extract_based', '["He is sleeping.", "He is angry about being locked up and losing his freedom.", "He is waiting for food.", "He is scared of visitors."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0203', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Which poetic device is used in the phrase ''quiet rage''?', 'extract_based', '["Simile", "Oxymoron", "Onomatopoeia", "Hyperbole"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0204', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

What is the contrast highlighted in the poem?', 'extract_based', '["Between a zoo tiger and a wild tiger", "Between a tiger and a lion", "Between visitors and tigers", "Between day and night"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Contrast the life of the tiger in the cage with his life in his natural habitat as described in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'A Tiger in the Zoo', 'In the cage, the tiger''s movement is restricted to a few steps. His majestic strength is locked behind bars, making him helpless, ignoring visitors, and staring at stars in quiet rage. In contrast, in the wild, he would lurk in shadows, slide through long grass, hunt near water bodies, and terrify villagers with his fangs, displaying his natural majesty and freedom.', '1. Describe caged tiger''s helplessness and quiet rage (1 mark)
2. Describe wild tiger''s freedom and predatory instincts (1 mark)
3. State the contrast between captivity and freedom (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Discuss how the poem ''A Tiger in the Zoo'' acts as a critique of caging wild animals.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'A Tiger in the Zoo', 'The poem critiques the confinement of wild animals for human entertainment. By contrasting the tiger''s vibrant, powerful natural state with his numbed, helpless, and angry existence in a concrete cell, the poet argues that keeping wild animals in zoos is a form of cruelty that strips them of their dignity, instincts, and fundamental right to freedom.', '1. Identify the theme of animal rights and freedom (1 mark)
2. Compare natural instincts vs. caged confinement (1 mark)
3. Conclude on the cruelty of zoos (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

Where is the reader suggested to go in this extract?', 'extract_based', '["Jungles in the west", "Jungles in the east", "A local zoo", "A desert"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What does the word ''tawny'' mean?', 'extract_based', '["Bright green", "Yellowish-brown", "Deep black", "Polka-dotted"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0302', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

How can you identify the Asian Lion according to the poet?', 'extract_based', '["By its quiet walk", "By its spots", "By its terrifying roar while you are dying", "By its friendly behavior"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0303', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What tone does the poet adopt in this poem?', 'extract_based', '["Serious and scientific", "Humorous and sarcastic", "Sad and mournful", "Aggressive"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0304', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What spelling alteration does the poet make in ''dyin'''' and why?', 'extract_based', '["A typo; error", "Poetic license; to maintain rhyme and rhythm", "Modern slang", "German translation"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'How does Carolyn Wells create humor in ''How to Tell Wild Animals'' through life-threatening situations?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'How to Tell Wild Animals', 'Carolyn Wells uses dark humor by describing dangerous meetings with wild beasts as simple identification tests. She suggests identifying an Asian Lion by its roar as you are ''dying'', a Bengal Tiger by the fact that he eats you, and a leopard by his leaping on you repeatedly. The contrast between extreme danger and casual advice creates a highly lighthearted, humorous effect.', '1. Explain the concept of using danger for humor (1 mark)
2. Give examples from the text (lion roaring while dying/tiger eating) (1 mark)
3. Define the humorous effect of the contrast (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'What is ''poetic license''? Give examples of how it is used in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'How to Tell Wild Animals', 'Poetic license is the freedom of a poet to violate conventional grammar, spelling, or pronunciation rules to fit a rhyme or meter. In this poem, Wells misspells ''dying'' as ''dyin'''' to rhyme with ''lion'', and uses ''lep'' and ''lep again'' instead of ''leap'' to maintain a quick, bouncing rhythm, enhancing the humor of the verses.', '1. Define poetic license (1 mark)
2. Identify ''dyin'' rhyming with ''lion'' (1 mark)
3. Identify ''lep'' for leap (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

What did the poet see bouncing down the street?', 'extract_based', '["A puppy", "A ball", "A child", "A coin"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

Where did the ball eventually go?', 'extract_based', '["Into a house", "Into the sewer", "Into the water (harbor)", "Into a park"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0402', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

How did the loss of the ball affect the boy?', 'extract_based', '["He was happy and went to buy a new one.", "He was fixed with a shaking grief, standing rigid and staring.", "He did not care.", "He cried loudly for his mother."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0403', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

Why does the poet choose not to comfort the boy with money or another ball?', 'extract_based', '["He is greedy.", "He wants the boy to learn the responsibility of loss and grow up.", "He has no money.", "He dislikes the boy."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0404', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

What does the ball symbolize in the poem?', 'extract_based', '["A toy only", "The boy''s innocent childhood days", "Money", "Sporting spirit"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'What does the poet mean by ''the epistemology of loss'' in ''The Ball Poem''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Ball Poem', 'The ''epistemology of loss'' refers to the study or understanding of what it means to lose something valuable. The poet wants the boy to stand up, learn how to cope with the pain of loss, and understand that material possessions are transient. It is a fundamental lesson in emotional maturity, teaching that loss is a natural part of human life.', '1. Define epistemology of loss as understanding loss (1 mark)
2. Explain that possessions are temporary (1 mark)
3. Highlight the lesson of standing up and growing up (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Why does the poet say ''Money is external'' in the context of the boy''s lost ball?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Ball Poem', 'The poet says ''Money is external'' because money can buy a new, physical ball, but it cannot buy back the memories, associations, and attachment the boy had with his original ball. The emotions connected to the lost childhood toys cannot be replaced by wealth, highlighting the limitations of material possessions in healing internal grief.', '1. Explain that money can buy replacements but not memories (1 mark)
2. Detail the emotional connection of the boy to the ball (1 mark)
3. Show the contrast between material wealth and emotional values (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0500', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

Who is likely speaking to Amanda in this extract?', 'extract_based', '["Her teacher", "Her friend", "Her parent (mother)", "Her brother"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0501', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What is the speaker''s main concern in the extract?', 'extract_based', '["Amanda''s education", "Amanda''s posture, habits, and behavior", "Amanda''s health", "Amanda''s clothes"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0502', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

How does Amanda respond internally to these instructions?', 'extract_based', '["She apologizes.", "She escapes into a fantasy world where she is a mermaid or orphan.", "She argues back.", "She starts crying."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0503', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What does ''slouching'' mean?', 'extract_based', '["Walking quickly", "Sitting or standing lazily with shoulders drooped", "Screaming", "Dancing"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0504', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What is the contrast in the poem''s structure?', 'extract_based', '["Between parent''s nagging and Amanda''s silent daydreaming", "Between school and home", "Between rich and poor", "Between reality and science fiction"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0500', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Discuss the contrast between the mother''s instructions and Amanda''s inner thoughts in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Amanda!', 'The poem alternates between the mother''s strict, nagging instructions (demanding Amanda sit straight, clean her room, do homework) and Amanda''s silent, italicized daydreams. In her fantasy, Amanda escapes control, imagining herself as a solitary mermaid in a calm sea, a free orphan walking on streets, or Rapunzel in a quiet tower, illustrating a deep desire for freedom from adult constant supervision.', '1. Detail the mother''s nagging demands (1 mark)
2. Explain Amanda''s fantasies of absolute freedom (1 mark)
3. Contrast parental control with a child''s need for personal space (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0501', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Why does Amanda wish to be an orphan in one of her daydreams?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Amanda!', 'Amanda wishes to be an orphan not because she dislikes her parents, but because she is suffocated by constant nagging. She envisions an orphan as having the absolute freedom to roam the streets barefoot and make quiet patterns in the soft dust without any voice telling her what to do, showing that to her, parental control feels worse than orphanhood.', '1. Connect the orphan daydream to the feeling of suffocation (1 mark)
2. Describe the imagery of freedom (barefoot, making dust patterns) (1 mark)
3. Highlight the extent of her desire to escape nagging (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0600', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Where are the trees at the start of the poem?', 'extract_based', '["In a public park", "In the wild forest", "Inside the poet''s house", "On a farm"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0601', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Why was the forest empty according to the extract?', 'extract_based', '["Due to forest fires", "Because trees were brought indoors for decoration, leaving the forest bare", "Due to a lack of rain", "Because animals ran away"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0602', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

What activities could not happen in the empty forest?', 'extract_based', '["Woodcutting", "Birds sitting, insects hiding, and sun burying feet in shadow", "Hunting", "Camping"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0603', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

What are the trees doing throughout the night?', 'extract_based', '["Sleeping quietly", "Struggling and working to free their roots, leaves, and branches to move out", "Growing flowers", "Singing"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0604', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Who is the poet of ''The Trees''?', 'extract_based', '["Adrienne Rich", "Robert Frost", "Robin Klein", "Leslie Norris"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0600', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'How does the poem ''The Trees'' serve as an allegory for women''s liberation?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Trees', 'In this poem, the trees inside the house represent women confined to domestic spaces. The forest represents society and the outside world. Just as the trees break through glass and floors to reclaim their natural forest home, women are breaking traditional barriers, moving out of domestic boundaries to occupy their rightful, active spaces in the public sphere, restoring social balance.', '1. Explain trees inside as women in domestic spaces (1 mark)
2. Explain the movement of trees to the forest as women gaining liberation (1 mark)
3. Discuss the themes of breaking barriers and reclaiming freedom (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0601', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Analyze the imagery of nature breaking free from human custody in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Trees', 'Adrienne Rich uses powerful dynamic imagery to show nature reclaiming its space. The roots work all night to disengage from veranda floors, leaves strain toward glass, and stiff twigs exert force. The poet compares the emerging branches to newly discharged patients blinking in surprise, showing nature''s fierce resilience in breaking free from human control.', '1. Detail the actions of roots, leaves, and twigs (1 mark)
2. Explain the comparison to newly discharged patients (1 mark)
3. Conclude on the theme of nature''s unstoppable resilience (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0700', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

How does the fog arrive according to the poet?', 'extract_based', '["With a loud thunder", "On little cat feet (silently and stealthily)", "With heavy winds", "Suddenly in the afternoon"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0701', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

What does the fog look over?', 'extract_based', '["A dense forest", "The harbor and the city", "Only residential areas", "A schoolyard"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0702', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

In what posture does the fog sit?', 'extract_based', '["Lying flat on the ground", "On silent haunches like a cat", "Floating high in clouds", "Disappearing rapidly"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0703', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

What does the fog do after sitting for some time?', 'extract_based', '["It rains heavily.", "It moves on silently.", "It turns into snow.", "It stays forever."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0704', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

Who is the poet of ''Fog''?', 'extract_based', '["Carl Sandburg", "Robert Frost", "Ogden Nash", "Carolyn Wells"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0700', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Compare the characteristics of the fog to those of a cat as depicted in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fog', 'Carl Sandburg creates an extended metaphor comparing the fog to a cat. Both arrive silently and stealthily (''on little cat feet''), without warning. Both sit quietly in one place, looking over their surroundings (''looking over harbor and city'') in a detached, peaceful manner on their haunches. Finally, both move on quietly without leaving a trace, highlighting their silent, elusive nature.', '1. Detail silent arrival of cat and fog (1 mark)
2. Compare sitting posture and observation of harbor/city (1 mark)
3. Explain the silent departure of both (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0701', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'How does Carl Sandburg capture a complex natural phenomenon in just six lines in ''Fog''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fog', 'Sandburg captures the essence of fog through simplicity and imagery. Instead of detailed explanations, he uses a single, powerful metaphor of a cat. This comparison evokes the silent arrival, the static hover over the harbor, and the quiet disappearance of the fog. By avoiding complex adjectives, he creates a memorable, atmospheric poem in a brief format.', '1. Discuss the brief, six-line structure (1 mark)
2. Highlight the effectiveness of the cat metaphor (1 mark)
3. Explain how it creates an atmospheric, vivid picture (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0800', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What are the names of Belinda''s kitten and mouse?', 'extract_based', '["Ink and Blink", "Mustard and Custard", "Jack and Jill", "Blackie and Grey"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0801', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What did Custard the dragon constantly cry for?', 'extract_based', '["More food", "A nice safe cage", "Gold coins", "A fight with a pirate"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0802', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

How did the other pets treat Custard before the pirate''s arrival?', 'extract_based', '["They feared him.", "They mocked and teased him, calling him cowardly.", "They ignored him.", "They respected him as their leader."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0803', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What did Custard do when the pirate broke into the house?', 'extract_based', '["He ran away and hid.", "He stood brave, snorted, clashed his tail, and swallowed the pirate whole.", "He started crying.", "He helped the pirate rob Belinda."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0804', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

Who is the poet of this humorous ballad?', 'extract_based', '["Ogden Nash", "Robert Frost", "Robin Klein", "Walt Whitman"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0800', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'How does Ogden Nash use irony to contrast the initial boasts of the pets with their behavior during the crisis?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Tale of Custard the Dragon', 'Nash uses irony to expose the empty bravery of Belinda''s pets. Belinda, Ink, Blink, and Mustard boast of their extreme courage (brave as bears, chasing lions down stairs). They mock Custard for crying for a safe cage. However, when the armed pirate breaks in, Belinda cries for help, Mustard flees barking, Ink hides in the basement, and Blink runs to his hole. The supposedly cowardly Custard is the only one who fights and swallows the pirate.', '1. Detail the initial boastful bravery of Belinda, Ink, Blink, Mustard (1 mark)
2. Describe their cowardly flight during the pirate''s entry (1 mark)
3. Highlight Custard''s heroic act as the ironical twist (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0801', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Analyze the poem ''The Tale of Custard the Dragon'' as a parody of a traditional ballad.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Tale of Custard the Dragon', 'A traditional ballad tells a serious story of heroism and adventure. Nash parodies this form by using a lighthearted, singsong rhyme scheme (aabb), choosing ridiculous names (Ink, Blink, Mustard, Custard), and using absurd descriptions ( Custard''s chimney-nose and dagger-toes). By making the hero a dragon who wants a cozy cage, he subverts typical heroic archetypes for comic effect.', '1. Define a ballad and how Nash parodies it (1 mark)
2. Detail the comedic elements, names, and rhymes (1 mark)
3. Explain the subversion of heroic archetypes (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0900', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

What color is Anne Gregory''s hair in the poem?', 'extract_based', '["Brown", "Honey-coloured (yellow/golden)", "Jet black", "Red"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0901', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

What does the speaker mean by ''ramparts at your ear''?', 'extract_based', '["A fort near her house", "Her thick, beautiful hair falling around her ears like protective walls", "A type of jewelry", "A loud sound"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0902', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

According to the speaker, what do young men love Anne Gregory for?', 'extract_based', '["Her intelligence", "Her yellow hair (physical beauty)", "Her kind nature", "Her wealth"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0903', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

How does Anne Gregory suggest she can change her hair to test lovers?', 'extract_based', '["By cutting it short", "By dyeing it brown, black, or carrot color", "By hiding it under a scarf", "By styling it differently"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0904', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

Who, according to the religious man, is the only one capable of loving Anne for herself alone?', 'extract_based', '["Her parents", "The speaker", "God", "No one"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0900', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Discuss the central theme of physical beauty versus inner worth in the poem ''For Anne Gregory''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'For Anne Gregory', 'The poem explores the conflict between external physical appearance and internal spiritual worth. The speaker asserts that young men are easily captivated by Anne''s beautiful honey-coloured hair and cannot look past her physical features to love her inner self. Anne tries to resist this by suggesting she can dye her hair, but the speaker concludes that only God is capable of loving a human being for their soul alone.', '1. Explain the young men''s obsession with physical beauty (yellow hair) (1 mark)
2. Detail Anne''s desire to be loved for her character/mind (1 mark)
3. State the conclusion that only God loves unconditionally (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0901', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Explain the metaphor of ''ramparts at your ear'' and how it relates to human relationships.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'For Anne Gregory', 'The ''ramparts'' metaphor compares Anne''s beautiful hair falling around her ears to the high protective walls of a fort. Just as ramparts prevent an intruder from entering a fortress, Anne''s striking physical beauty acts as a barrier that prevents men from looking deeper to appreciate her inner personality. They are trapped by her outer looks, highlighting the superficial nature of human attraction.', '1. Identify and explain the metaphor ''ramparts at your ear'' (1 mark)
2. Connect the barrier image to human relationships (1 mark)
3. Show how physical beauty obscures inner qualities (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Every morning, my father _______ the newspaper with his tea.', 'multiple_choice', '["read", "reads", "is reading", "has read"]', 1, NULL, 1, 'Simple present is used for habitual actions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Look! The birds _______ south for the winter.', 'multiple_choice', '["fly", "are flying", "have flown", "flied"]', 1, NULL, 1, 'Present continuous is used for actions happening at the moment of speaking.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0002', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: By the time the doctor arrived, the patient _______.', 'multiple_choice', '["died", "has died", "had died", "is dying"]', 2, NULL, 1, 'Past perfect is used for the earlier of two completed past actions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0003', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: I _______ English for five years now.', 'multiple_choice', '["study", "am studying", "have been studying", "studied"]', 2, NULL, 1, 'Present perfect continuous is used for actions starting in the past and continuing now.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0004', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: We _______ to the zoo last Sunday.', 'multiple_choice', '["go", "went", "have gone", "were going"]', 1, NULL, 1, 'Simple past is used for actions completed at a specific past time.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0005', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Tomorrow at this time, we _______ our exams.', 'multiple_choice', '["write", "will be writing", "have written", "wrote"]', 1, NULL, 1, 'Future continuous is used for actions in progress at a specific future time.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0006', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: She _______ her homework before going to play.', 'multiple_choice', '["finished", "finishes", "had finished", "is finishing"]', 2, NULL, 1, 'Past perfect indicates completion before another past event (going to play).', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0007', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: The sun _______ in the east.', 'multiple_choice', '["rise", "rises", "is rising", "rose"]', 1, NULL, 1, 'Simple present is used for universal truths.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0008', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: They _______ in this house since 2015.', 'multiple_choice', '["live", "are living", "have lived", "lived"]', 2, NULL, 1, 'Present perfect is used for states starting in the past and continuing up to the present.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0009', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: If it _______ tomorrow, we will cancel the picnic.', 'multiple_choice', '["rains", "will rain", "rained", "is raining"]', 0, NULL, 1, 'In conditional clauses, simple present is used for future conditions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: You _______ respect your elders and teachers.', 'multiple_choice', '["should", "must", "ought to", "can"]', 2, NULL, 1, '''Ought to'' represents a moral obligation or duty.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: _______ you please open the door for me?', 'multiple_choice', '["May", "Could", "Should", "Must"]', 1, NULL, 1, '''Could'' is used for polite requests.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: It is cloudy; it _______ rain tonight.', 'multiple_choice', '["may", "must", "should", "would"]', 0, NULL, 1, '''May'' expresses a strong possibility based on evidence.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: Drivers _______ stop when the traffic light turns red.', 'multiple_choice', '["should", "can", "must", "may"]', 2, NULL, 1, '''Must'' indicates a legal requirement or rule.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: I _______ run ten miles when I was younger.', 'multiple_choice', '["can", "could", "should", "might"]', 1, NULL, 1, '''Could'' represents a general ability in the past.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0105', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: She _______ practice daily if she wants to win the competition.', 'multiple_choice', '["should", "must", "ought", "might"]', 0, NULL, 1, '''Should'' indicates a strong recommendation or advice.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0106', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: You _______ not enter this room; it is restricted.', 'multiple_choice', '["must", "should", "could", "would"]', 0, NULL, 1, '''Must not'' indicates a strict prohibition.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0107', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: _______ I borrow your pen, please?', 'multiple_choice', '["Should", "May", "Must", "Would"]', 1, NULL, 1, '''May'' is the formal modal for seeking permission.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0108', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: If you study hard, you _______ pass the board exams.', 'multiple_choice', '["will", "should", "might", "would"]', 0, NULL, 1, '''Will'' indicates a high certainty of future outcome.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0109', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: We _______ protect our environment for future generations.', 'multiple_choice', '["might", "must", "could", "can"]', 1, NULL, 1, '''Must'' represents an absolute necessity or strong obligation.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: Rahul said, ''I am reading a book.'' Choose the correct indirect speech.', 'multiple_choice', '["Rahul said that he was reading a book.", "Rahul said that I was reading a book.", "Rahul says he is reading a book.", "Rahul said he had read a book."]', 0, NULL, 1, 'Present continuous changes to past continuous, and pronouns shift.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said to me, ''Where are you going?'' Choose the correct indirect speech.', 'multiple_choice', '["She asked me where I was going.", "She asked me where was I going.", "She told me where I am going.", "She asked me if I was going."]', 0, NULL, 1, 'In questions, reporting verb changes to ''asked'', and question order becomes statement order.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0202', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: The teacher said, ''The Earth revolves around the Sun.'' Choose the correct indirect speech.', 'multiple_choice', '["The teacher said that the Earth revolved around the Sun.", "The teacher said that the Earth revolves around the Sun.", "The teacher says the Earth is revolving.", "The teacher told that the Earth revolves."]', 1, NULL, 1, 'Tense of universal truths does not change in reported speech.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0203', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: He said, ''I have finished my work.'' Choose the correct indirect speech.', 'multiple_choice', '["He said that he has finished his work.", "He said that he had finished his work.", "He told that he finished his work.", "He says he had finished."]', 1, NULL, 1, 'Present perfect changes to past perfect.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0204', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said, ''I will call you tomorrow.'' Choose the correct indirect speech.', 'multiple_choice', '["She said that she will call me the next day.", "She said that she would call me the next day.", "She told she calls me tomorrow.", "She said that she would call you tomorrow."]', 1, NULL, 1, '''Will'' changes to ''would'', ''tomorrow'' changes to ''the next day''.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0205', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: Mother said to Anil, ''Go to your room immediately.'' Choose the correct indirect speech.', 'multiple_choice', '["Mother ordered Anil to go to his room immediately.", "Mother said to Anil that go to your room.", "Mother asked Anil to went to his room.", "Mother told Anil he goes to his room."]', 0, NULL, 1, 'Imperative sentences use ''ordered/told + to-infinitive''.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0206', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: He asked, ''Are you coming with us?'' Choose the correct indirect speech.', 'multiple_choice', '["He asked if I was coming with them.", "He asked that whether I am coming with them.", "He asked me if I am coming.", "He says if I am coming."]', 0, NULL, 1, 'Yes/No questions use ''if'' or ''whether'' as connectors.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0207', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: The doctor said, ''Take this medicine twice a day.'' Choose the correct indirect speech.', 'multiple_choice', '["The doctor advised to take that medicine twice a day.", "The doctor advised me to take this medicine twice a day.", "The doctor tells to take medicine.", "The doctor ordered to took medicine."]', 0, NULL, 1, 'Doctor''s instructions are reported using ''advised'' + to-infinitive.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0208', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: They said, ''We won the match!'' Choose the correct indirect speech.', 'multiple_choice', '["They exclaimed with joy that they had won the match.", "They said that they won the match.", "They exclaimed they win the match.", "They told with joy they won."]', 0, NULL, 1, 'Exclamatory sentences use ''exclaimed with joy/sorrow'' + that clause in past perfect.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0209', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said, ''I can speak three languages.'' Choose the correct indirect speech.', 'multiple_choice', '["She said that she could speak three languages.", "She said that she can speak three languages.", "She says she could speak.", "She told that she can speak."]', 0, NULL, 1, '''Can'' changes to ''could'' in reported speech.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The quality of these mangoes _______ not good.', 'multiple_choice', '["is", "are", "were", "be"]', 0, NULL, 1, 'The subject is the singular noun ''quality'', not ''mangoes''.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Bread and butter _______ our daily breakfast.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, 'When two singular nouns represent a single collective idea, they take a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0302', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Either you or he _______ to clean the room.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, 'In ''either... or'' structures, the verb agrees with the closer subject (''he'' is singular).', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0303', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Neither of the two candidates _______ selected.', 'multiple_choice', '["was", "were", "are", "have been"]', 0, NULL, 1, '''Neither'' is a singular pronoun and takes a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0304', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: A pair of scissors _______ lying on the table.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, '''A pair of'' makes the collective noun singular, requiring ''is''.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0305', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The team _______ practicing hard for the finals.', 'multiple_choice', '["is", "are", "have", "were"]', 0, NULL, 1, 'A collective noun like ''team'' takes a singular verb when acting as a single unit.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0306', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Physics _______ my favorite subject in school.', 'multiple_choice', '["is", "are", "were", "be"]', 0, NULL, 1, 'Names of subjects ending in -s (like Physics, Mathematics) are singular.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0307', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Many a student _______ made this common mistake.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, '''Many a'' is followed by a singular noun and a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0308', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The Prime Minister, along with his ministers, _______ arrived.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, 'With ''along with'', the verb agrees with the first subject (''Prime Minister'' is singular).', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0309', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Ten kilometers _______ a long distance to walk.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, 'A specific quantity of distance or time is treated as a singular unit.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''He is tallest boy in the class.'' Identify the error and select the correct replacement.', 'multiple_choice', '["He is taller boy...", "He is the tallest boy...", "He is a tallest boy...", "No error"]', 1, NULL, 1, 'Superlatives (''tallest'') must be preceded by the definite article ''the''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''I prefer tea than coffee.'' Identify the error and select the correct replacement.', 'multiple_choice', '["I prefer tea for coffee.", "I prefer tea to coffee.", "I prefer tea over coffee.", "No error"]', 1, NULL, 1, 'The verb ''prefer'' is followed by the preposition ''to'' when making comparisons.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0402', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''Each of the girls have brought her book.'' Identify the error and select the correct replacement.', 'multiple_choice', '["Each of the girls has brought her book.", "Each of the girls have brought their book.", "Each of the girls having brought...", "No error"]', 0, NULL, 1, '''Each'' is a singular subject and must agree with the singular verb ''has''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0403', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''She has been working here since two hours.'' Identify the error and select the correct replacement.', 'multiple_choice', '["...working here for two hours.", "...working here from two hours.", "...worked here since two hours.", "No error"]', 0, NULL, 1, '''For'' is used for a duration/period of time (two hours), whereas ''since'' is for a point in time.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0404', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''Although he worked hard, but he failed.'' Identify the error and select the correct replacement.', 'multiple_choice', '["Although he worked hard, he failed.", "Although he worked hard, yet he failed.", "No error", "Although he worked hard, and he failed."]', 0, NULL, 1, 'Do not use ''but'' in sentences starting with ''although'' (it creates a double conjunction error).', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0405', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''One of my friend is a doctor.'' Identify the error and select the correct replacement.', 'multiple_choice', '["One of my friends are a doctor.", "One of my friends is a doctor.", "One of my friend are a doctor.", "No error"]', 1, NULL, 1, '''One of'' must be followed by a plural noun (''friends'') and a singular verb (''is'').', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0406', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''The news of the accident are shocking.'' Identify the error and select the correct replacement.', 'multiple_choice', '["The news of the accident is shocking.", "The news of the accident were shocking.", "No error", "The news of the accident been shocking."]', 0, NULL, 1, 'The noun ''news'' is singular in usage and takes a singular verb (''is'').', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0407', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''She doesn''t know nothing about the matter.'' Identify the error and select the correct replacement.', 'multiple_choice', '["She doesn''t know anything about the matter.", "She knows anything about the matter.", "No error", "She doesn''t know something about the matter."]', 0, NULL, 1, 'Avoid double negatives (''doesn''t'' + ''nothing''). Use ''doesn''t know anything''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0408', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''The bird spread it''s wings and flew.'' Identify the error and select the correct replacement.', 'multiple_choice', '["...spread its wings...", "...spread its'' wings...", "...spread it wings...", "No error"]', 0, NULL, 1, '''Its'' is the possessive pronoun; ''it''s'' is the contraction of ''it is''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0409', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''He is looking forward to meet you.'' Identify the error and select the correct replacement.', 'multiple_choice', '["He is looking forward to meeting you.", "He is looking forward for meeting you.", "No error", "He is looking forward to met you."]', 0, NULL, 1, 'The phrase ''looking forward to'' takes a gerund (''meeting'') as its object.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f00', 'You are Karan/Kiran, residing at 12, Mall Road, Shimla. Write a letter to the Editor of a national daily expressing your concern about the increasing traffic congestion in hill stations during the summer holiday season, leading to pollution and local inconvenience.', 'letter_writing', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Letter Writing Assessment', '12, Mall Road
Shimla

24 June 2026

The Editor
The Daily Chronicle
New Delhi

Subject: Rising traffic congestion and pollution in hill stations

Sir

Through the columns of your widely circulated newspaper, I wish to voice my deep concern regarding the alarming increase in traffic congestion and environmental degradation in Shimla during the peak summer holidays.

Every summer, a massive influx of tourists visits our town to escape the heat of the plains. While tourism is economically beneficial, the uncontrolled entry of thousands of private vehicles has paralyzed our roads. Local residents face severe daily delays, and the narrow mountain streets are permanently choked. The exhaust fumes have created a thick layer of smog, destroying the clean mountain air. Furthermore, tourist littering is choking our drainage systems, ruining the scenic beauty.

To resolve this, local authorities must restrict the entry of outside private vehicles, set up satellite parking lots at the borders, and run electric tourist shuttles. I hope this letter prompts the administration to take immediate steps to preserve our fragile ecosystem.

Yours faithfully
Kiran', 'Format - 1 Mark: Includes Sender''s address, Date, Receiver''s address, Subject, Salutation, Complimentary close, and Name.
Content - 2 Marks: Highlights the tourist influx, mentions congestion and smog, details local inconvenience, and suggests satellite parking and electric shuttles.
Expression - 2 Marks: Evaluates grammatical accuracy, appropriate vocabulary (fragile ecosystem, choked streets), and coherent paragraph transitions.'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f01', 'Write an analytical paragraph in 100-120 words analyzing the preference of high school students for various learning methods. The data shows: Online Classes (35% in 2024, 20% in 2026), Offline Classes (50% in 2024, 65% in 2026), Hybrid Model (15% in 2024, 15% in 2026). Give the paragraph a suitable title.', 'paragraph_writing', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Analytical Paragraph Assessment', 'Student Preferences for Learning Methods (2024-2026)

The comparative data illustrates the shifting preferences of high school students regarding learning methods between the years 2024 and 2026. The three modes analyzed are online classes, offline classes, and the hybrid model.

In 2024, offline classes were the most popular choice, chosen by exactly half of the student population (50%). Online classes followed at 35%, while the hybrid model was the least popular at 15%. By 2026, a significant shift occurred. The preference for physical offline classes surged by 15% to reach a peak of 65%. In contrast, the popularity of online learning dropped sharply to 20%. The hybrid model remained completely stable at 15% in both years.

Overall, the data suggests a clear trend: students increasingly prefer traditional physical classrooms for their learning, while support for purely virtual learning continues to decline.', 'Title & Introduction - 1 Mark: Suitable title provided; paraphrases the prompt outlining the three learning modes and years.
Data Comparison - 2 Marks: Highlights the rise in offline classes (50% to 65%), the drop in online classes (35% to 20%), and the stable hybrid rate (15%).
Conclusion & Expression - 2 Marks: Clear concluding statement indicating the general trend; checks grammatical correctness, spelling, and coherence.'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f02', 'Complete the story in 150-200 words starting with the line: ''As I opened the door, a cold breeze rushed in, blowing away the papers on my desk...''', 'story_completion', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Story Completion Assessment', 'The Mysterious Caller

As I opened the door, a cold breeze rushed in, blowing away the papers on my desk. The street outside was pitch dark, illuminated only by a single flickering lamppost. I looked around, but there was no one in sight. 

Just as I was about to close the door, my eyes fell on a small, sealed envelope lying on the welcome mat. It was addressed to me in elegant, golden cursive handwriting. My heart raced with curiosity as I picked it up and walked back inside, securing the door behind me. I tore open the envelope. Inside was a single ticket to London and a note that read: "Your train leaves in exactly one hour. The truth is waiting for you."

Suddenly, my phone buzzed. An unknown number texted me a photo of the golden pocket watch my grandfather had lost thirty years ago. I realized that my quiet, academic life was about to change. Without thinking twice, I grabbed my coat and rushed into the night, heading toward the railway station. The adventure had officially begun.', 'Opening & Plot - 2 Marks: Integrates the opening line smoothly; creates suspense with a mysterious letter and a phone photo of a lost watch.
Coherence & Vocabulary - 2 Marks: Maintains a logical flow, strong adjectives (flickering lamppost, elegant cursive), and past tense consistency.
Title & Resolution - 1 Mark: Includes a suitable title; ends with a compelling cliffhanger resolution.')
ON CONFLICT (id) DO NOTHING;
