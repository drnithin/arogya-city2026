-- ============================================================
--  AROGYA CITY · Edition II pledges  (auto-generated from documents)
--  Paste into Supabase SQL Editor and Run. Safe to run more than once.
--  Creates each organisation + an empty submission row (status not_opened).
-- ============================================================

insert into pledges (token, org, contact, title, recap, commitments) values (
  'arogya-world',
  'Arogya World',
  'Dr. Meghana Pasi, Head - MyThali Program',
  'Advocacy on nutrition and healthy lifestyle through social media and on-ground activities',
  'You set out to reach Bengalureans with <span class="hl">nutrition advocacy on social media</span>, to empower women''s heart health with a <span class="hl">Run in Red</span> event, and to make everyday food healthier by <span class="hl">training small restaurant owners</span> to cook with less salt and oil.',
  '[{"title": "Reach Bengalureans on social media", "committed": 100000, "unit": "people engaged", "mode": "online", "said": "Engage 1 lakh Bengalureans through quizzes, reels, polls, contests and lives on @my.thali.", "prompt": "Which campaign landed best? Any reel or contest you are proud of?"}, {"title": "Run in Red for women''s heart health", "committed": 1000, "unit": "women active", "mode": "offline", "said": "1,000 women will run, walk or move at our offline Run in Red events.", "prompt": "Where did you hold it, and who joined you as partners?"}, {"title": "Train small restaurant owners", "committed": 100, "unit": "owners trained", "mode": "offline", "said": "Train 100 small restaurant owners to cut salt and oil and drop palm oil, with follow-up visits.", "prompt": "Did the follow-up visits show the cooking habits changed?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='arogya-world' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'baf',
  'Bangalore Apartments'' Federation (BAF)',
  'Upender Singh, Governing Council Member',
  'BAF Kshema',
  'Through BAF Kshema you set out to protect apartment staff, by <span class="hl">extending health insurance to 500 staff</span> and running <span class="hl">onsite health awareness sessions for 1,000 workers</span> across apartment communities.',
  '[{"title": "Extend health insurance to apartment staff", "committed": 500, "unit": "staff covered", "mode": "offline", "said": "Extend health insurance to 500 apartment staff.", "prompt": "How did the insurance rollout go? Any partner that helped?"}, {"title": "Onsite health awareness sessions", "committed": 1000, "unit": "staff reached", "mode": "offline", "said": "Conduct onsite health awareness sessions for 1,000 women workers in apartments.", "prompt": "What topics resonated most with the workers?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='baf' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'biocon',
  'Biocon Foundation',
  'Dr. Vikram U, Manager',
  'Sankalp',
  'Through Sankalp you set out to <span class="hl">screen 20,000 people</span> for early signs of disease, including oral cancer screening via your mHealth app, to catch problems before they grow.',
  '[{"title": "Screen people for NCDs and oral cancer", "committed": 20000, "unit": "people screened", "mode": "offline", "said": "Screen 20,000 people, using the mHealth app to screen for oral cancers.", "prompt": "How many screenings led to a referral or follow-up?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='biocon' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'clinikk',
  'Clinikk',
  'Deepti Bhaskaran, Head - Strategic Initiatives (Insurance)',
  'Prevent and Protect with Clinikk',
  'You set out to <span class="hl">impact 15,000 lives</span> by screening Clinikk customers for NCDs and building <span class="hl">customized care pathways</span> for those with diabetes and hypertension, with ongoing follow-ups.',
  '[{"title": "Screen customers and build care pathways", "committed": 15000, "unit": "lives impacted", "mode": "offline", "said": "Impact 15,000 lives by screening for NCDs and building care plans for diabetes and hypertension.", "prompt": "What did the follow-ups show about customers'' health over time?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='clinikk' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'green-path',
  'Green Path',
  'H. R. Jayaram, Founder',
  'Food is Medicine. Good Food Movement.',
  'Through the Good Food Movement you set out to <span class="hl">reach 110,000 people</span> with healthy, organic food, through your restaurant, weekend organic melas, and advocacy for good food as medicine.',
  '[{"title": "Reach people with the Good Food Movement", "committed": 110000, "unit": "people reached", "mode": "offline", "said": "Reach 110,000 Bengalureans with healthy organic food through the restaurant, store, melas and catering.", "prompt": "Which channel reached the most people this cycle?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='green-path' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'intoto',
  'InToTo Health (Arcanebyte Private Limited)',
  'Ananth Sharma, Director',
  'InToTo Health NCD tracking platform',
  'You set out to bring <span class="hl">5,000 users</span> onto the InToTo Health platform, using it to track, monitor and personalise care for individuals living with an NCD.',
  '[{"title": "Onboard users to the NCD tracking platform", "committed": 5000, "unit": "users onboarded", "mode": "online", "said": "Reach 5,000 users on the platform for tracking and personalised NCD care.", "prompt": "How did users respond to the follow-up and tracking features?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='intoto' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'inclusiv',
  'Inclusiv',
  'Dr. Veena Shenoy, Founder and Chief Accessibility Officer',
  'Creating Inclusive and Accessible Societies',
  'You set out to build a barrier-free Bengaluru for people with disabilities and the elderly, through <span class="hl">township accessibility audits</span> and <span class="hl">awareness sessions</span> that promote understanding of diversity.',
  '[{"title": "Township public accessibility audits", "committed": 2, "unit": "audits completed", "mode": "offline", "said": "Conduct 2 township public accessibility audits.", "prompt": "What were the biggest accessibility gaps you found?"}, {"title": "Awareness sessions on inclusion", "committed": 10, "unit": "sessions held", "mode": "offline", "said": "Hold 10 awareness sessions to promote understanding and acceptance of diversity.", "prompt": "Which session had the most impact on attendees?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='inclusiv' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'jayanagar-jaguars',
  'Jayanagar Jaguars (JJActive Pvt. Ltd.)',
  'Pramod Deshpande, Head Coach & Managing Director',
  'Making everyone active',
  'You set out to get Bengaluru moving, reaching <span class="hl">7,000 individuals</span> through fitness sessions and events, supported by your homegrown ONCA Run app.',
  '[{"title": "Engage people in fitness sessions and events", "committed": 7000, "unit": "individuals active", "mode": "offline", "said": "Reach 7,000 individuals through participation in fitness sessions and events.", "prompt": "Which event or initiative drew the biggest turnout?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='jayanagar-jaguars' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'manah-wellness',
  'Manah Wellness',
  'Manoj Chandran, Chief Marketing Officer',
  'Championing mental wellbeing',
  'You set out to <span class="hl">train 3,000 mental wellbeing champions</span> at workplaces across Bengaluru, using your digital platform and AI copilot to support them as they help colleagues.',
  '[{"title": "Train mental wellbeing champions", "committed": 3000, "unit": "champions trained", "mode": "offline", "said": "Train 3,000 mental wellbeing champions at workplaces in Bengaluru.", "prompt": "What kind of impact did the champions report in their workplaces?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='manah-wellness' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'nasvi',
  'New Association of Street Vendors of India (NASVI)',
  'Athira Rana, Outreach and Partnership Manager',
  'Healthy cooking for street food vendors',
  'You set out to help <span class="hl">4,000 street food vendors</span> cook healthier, spreading awareness on using less salt and less oil (and no reused oil), through market meetings and your Street Saarthi app.',
  '[{"title": "Awareness on minimum salt use", "committed": 4000, "unit": "vendors reached", "mode": "offline", "said": "Reach 4,000 street vendors with awareness on minimum use of salt in daily vending.", "prompt": "How receptive were the vendors to changing their cooking?"}, {"title": "Awareness on minimum oil use and no reuse", "committed": 4000, "unit": "vendors reached", "mode": "offline", "said": "Reach 4,000 street vendors on minimum use of oil and no reuse of oil for frying.", "prompt": "Did you see vendors actually change their oil practices?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='nasvi' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'narayana-nethralaya',
  'Narayana Nethralaya',
  'Gp Capt S. K. Mittal VSM, CEO',
  'Eye health screening and awareness',
  'You set out to protect Bengaluru''s eye health, by <span class="hl">screening 3,000 for glaucoma</span>, <span class="hl">8,000 children for myopia</span>, and counselling <span class="hl">2,000 diabetic patients</span>, while raising awareness among lakhs more.',
  '[{"title": "Screen individuals for glaucoma", "committed": 3000, "unit": "people screened", "mode": "offline", "said": "Screen 3,000 individuals for glaucoma, focusing on high-risk groups.", "prompt": "How many suspected cases did you refer for further care?"}, {"title": "Screen children for myopia", "committed": 8000, "unit": "children screened", "mode": "offline", "said": "Screen 8,000 children for myopia through the Smart School screening program.", "prompt": "What did the school screenings reveal about children''s eye health?"}, {"title": "Counsel patients with uncontrolled diabetes", "committed": 2000, "unit": "patients counselled", "mode": "offline", "said": "Screen and counsel 2,000 patients with uncontrolled diabetes with personalised plans.", "prompt": "Did the personalised plans help patients control their diabetes?"}, {"title": "Raise awareness on eye health", "committed": 100000, "unit": "people reached", "mode": "online", "said": "Raise awareness among 1,00,000 people on diabetes and diabetic retinopathy via digital and offline channels.", "prompt": "Which awareness channel worked best for you?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='narayana-nethralaya' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'niramai',
  'Niramai Health Analytix',
  '',
  '25,000 Breast Cancer Screenings in Bengaluru',
  'You set out to <span class="hl">conduct 25,000 breast cancer screenings</span> for women of all ages across Bengaluru, through partner hospitals, government organisations and corporate screening camps.',
  '[{"title": "Breast cancer screenings for women", "committed": 25000, "unit": "screenings done", "mode": "offline", "said": "Conduct 25,000 breast cancer screenings from Jan 2025 to Dec 2026.", "prompt": "Where did most screenings happen, and any early detections to note?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='niramai' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'philips',
  'Philips',
  'Mr. Adarsh Holavanahalli, Business Head',
  'Philips HeartPrint Services will touch over 100K lives',
  'Through HeartPrint you set out to <span class="hl">touch over 100,000 lives</span> in Bengaluru, creating awareness about heart health and helping people spot early warning signs to take proactive care of their hearts.',
  '[{"title": "Reach people with HeartPrint heart-health awareness", "committed": 100000, "unit": "lives touched", "mode": "offline", "said": "Touch over 100,000 lives in Bengaluru with heart-health awareness and screening through HeartPrint.", "prompt": "Which touchpoints or events reached the most people?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='philips' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'rotary-3191',
  'Rotary District 3191, Bengaluru',
  'Rtn. Mohan Nallur, Chairman - Wellness & Fitness Committee',
  'Wellness and Fitness for Rotarians and beyond',
  'You set out to build a culture of wellness across the Rotary family, reaching <span class="hl">3,000 Rotarians</span> and <span class="hl">1,000 Rotaractors and Interactors</span> with weekly wellness messages, monthly activities, webinars and quarterly fitness challenges.',
  '[{"title": "Engage Rotarians in wellness activities", "committed": 3000, "unit": "Rotarians reached", "mode": "offline", "said": "Reach 3,000 Rotarians with wellness messages, activities, webinars and fitness challenges.", "prompt": "Which activity got the most enthusiastic response?"}, {"title": "Engage Rotaractors and Interactors", "committed": 1000, "unit": "members reached", "mode": "offline", "said": "Reach 1,000 Rotaractors and Interactors through the wellness initiative.", "prompt": "How did the younger members take to the challenges?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='rotary-3191' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'tdu',
  'University of Trans-Disciplinary Health Sciences (TDU)',
  '',
  'Food Futures - Nutrition for Health',
  'Through Food Futures you set out to <span class="hl">touch 5,800 lives</span> with nutrition-for-health programs, spanning Food Forests, and nutrition education for both <span class="hl">adults and children</span>.',
  '[{"title": "Food Forests program", "committed": 500, "unit": "people reached", "mode": "offline", "said": "Reach 500 people through the Food Forests program.", "prompt": "How did communities engage with the Food Forests?"}, {"title": "Nutrition education for adults", "committed": 1000, "unit": "adults reached", "mode": "offline", "said": "Reach 1,000 adults through nutrition education.", "prompt": "What nutrition messages resonated most with adults?"}, {"title": "Nutrition education for children", "committed": 700, "unit": "children reached", "mode": "offline", "said": "Reach 700 children through nutrition education.", "prompt": "How did the children respond to the sessions?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='tdu' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'vayah-vikas',
  'Vayah Vikas',
  'Ms. Pavithra Reddy, COO',
  'Healthy ageing for seniors',
  'You set out to improve the lives of Bengaluru''s seniors, aiming to <span class="hl">directly touch 12,000 lives</span> through preventive health camps, webinars, and engagement activities that help seniors stay healthy and connected.',
  '[{"title": "Reach seniors through health and engagement activities", "committed": 12000, "unit": "lives touched", "mode": "offline", "said": "Directly touch 12,000 senior lives through camps, webinars and engagement activities.", "prompt": "Which camps or activities made the biggest difference for seniors?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='vayah-vikas' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'wow',
  'WOW Group',
  'Shwetha S, President',
  'Gift Sustainable Health',
  'Through Gift Sustainable Health you set out to <span class="hl">reach 3,000 people</span> with health awareness, using quizzes, riddles and community activities across your neighbourhood groups and associations.',
  '[{"title": "Reach people with health awareness", "committed": 3000, "unit": "people reached", "mode": "offline", "said": "Reach 3,000 people with health awareness through quizzes, riddles and community activities.", "prompt": "Which activity got your community most engaged?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='wow' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'wipro',
  'Wipro',
  '',
  'Prevent to Protect - Reaching 50,000 for NCD prevention',
  'Through Prevent to Protect you set out to <span class="hl">reach 50,000 people</span> in Bengaluru''s slum communities, building NCD awareness, strengthening frontline health workers, and improving screening and access to public health systems.',
  '[{"title": "Reach the community for NCD prevention", "committed": 50000, "unit": "people reached", "mode": "offline", "said": "Reach 50,000 slum-community members with NCD awareness, screening and better access to care.", "prompt": "How did the community respond to NCD screening?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='wipro' on conflict (token) do nothing;

insert into pledges (token, org, contact, title, recap, commitments) values (
  'abet-mpower',
  'Mpower - Aditya Birla Education Trust',
  '',
  'Step Above Mental Health Stigma in Bengaluru',
  'You set out to <span class="hl">reach 200,000 people</span> in Bengaluru to stamp out mental health stigma, through <span class="hl">750 awareness workshops</span>, college mental health clubs, and capacity-building programs.',
  '[{"title": "Reach people to reduce mental health stigma", "committed": 200000, "unit": "people reached", "mode": "online", "said": "Reach 200,000 individuals in Bengaluru to create awareness and reduce mental health stigma.", "prompt": "Which channel or campaign drove the most awareness?"}, {"title": "Mental health awareness workshops and support groups", "committed": 750, "unit": "workshops held", "mode": "offline", "said": "Run 750 mental health awareness workshops and support groups to normalise conversations.", "prompt": "What change did you see in help-seeking behaviour?"}, {"title": "Capacity-building programs", "committed": 50, "unit": "programs run", "mode": "offline", "said": "Run 50 capacity-building programs to create mental health first-responders and champions.", "prompt": "How are the trained champions applying their skills?"}]'::jsonb
) on conflict (token) do update set org=excluded.org, contact=excluded.contact, title=excluded.title, recap=excluded.recap, commitments=excluded.commitments;
insert into submissions (pledge_id, token, status) select id, token, 'not_opened' from pledges where token='abet-mpower' on conflict (token) do nothing;
