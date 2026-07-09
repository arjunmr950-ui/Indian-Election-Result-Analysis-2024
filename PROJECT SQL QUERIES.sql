--TOTAL NUMBER OF SEAT
SELECT 
DISTINCT COUNT (Parliament_Constituency) AS Total_Seats
FROM constituencywise_results


--WHAT ARE THE TOTAL NUMBER OF SEAT AVAILABLE FOR ELECTION IN EACH STATES
SELECT
s.state AS State_Name,
COUNT (cr.parliament_constituency) AS Total_Seats
FROM
constituencywise_results cr
INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s ON sr.state_id = s.state_id
GROUP BY s.state


--TOTAL SEATS  WON BY NDA ALLIANCE
SELECT
   SUM(CASE
          WHEN party IN (
               'Bharatiya Janata Party - BJP',
               'Telugu Desam - TDP',
               'Janata Dal  (United) - JD(U)',
               'Shiv Sena - SHS',
               'AJSU Party - AJSUP',
               'Apna Dal (Soneylal) - ADAL', 
               'Asom Gana Parishad - AGP',
               'Hindustani Awam Morcha (Secular) - HAMS', 
               'Janasena Party - JnP', 
		       'Janata Dal  (Secular) - JD(S)',
               'Lok Janshakti Party(Ram Vilas) - LJPRV', 
               'Nationalist Congress Party - NCP',
               'Rashtriya Lok Dal - RLD', 
               'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results


--SEAT WON BY NDA ALLIANCE PARTIES
SELECT
    party as Party_Name,
    won as Seats_Won
FROM
    partywise_results
WHERE 
    party IN ('Bharatiya Janata Party - BJP',
               'Telugu Desam - TDP',
               'Janata Dal  (United) - JD(U)',
               'Shiv Sena - SHS',
               'AJSU Party - AJSUP',
               'Apna Dal (Soneylal) - ADAL', 
               'Asom Gana Parishad - AGP',
               'Hindustani Awam Morcha (Secular) - HAMS', 
               'Janasena Party - JnP', 
		       'Janata Dal  (Secular) - JD(S)',
               'Lok Janshakti Party(Ram Vilas) - LJPRV', 
               'Nationalist Congress Party - NCP',
               'Rashtriya Lok Dal - RLD', 
               'Sikkim Krantikari Morcha - SKM')
ORDER BY Seats_Won DESC


--TOTAL SEAT WON BY I.N.D.I.A ALLIANCE
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK',
                 'Nat`Jammu & Kashmir National Conference - JKN'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results


----SEAT WON BY I.N.D.I.A ALLIANCE PARTIES
SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK',
                 'Nat`Jammu & Kashmir National Conference - JKN')
ORDER BY Seats_Won DESC

--ADD NEW COLUMN FIELD IN TABLE PARTYWISE_RESULT TO GET THE PARTY ALLIANZ AS NDA, I.N.D.I.A AND OTHER
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(100) --THIS IS HOW NEW COLUMN IS ADDED TO A TABLE


--INSERTING I.N.D.I.A DETAILS IN PARTYWISE RESULT
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
);

--INSERTING NDA DETAILS IN PARTYWISE RESULT
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN ('Bharatiya Janata Party - BJP',
               'Telugu Desam - TDP',
               'Janata Dal  (United) - JD(U)',
               'Shiv Sena - SHS',
               'AJSU Party - AJSUP',
               'Apna Dal (Soneylal) - ADAL', 
               'Asom Gana Parishad - AGP',
               'Hindustani Awam Morcha (Secular) - HAMS', 
               'Janasena Party - JnP', 
		       'Janata Dal  (Secular) - JD(S)',
               'Lok Janshakti Party(Ram Vilas) - LJPRV', 
               'Nationalist Congress Party - NCP',
               'Rashtriya Lok Dal - RLD', 
               'Sikkim Krantikari Morcha - SKM'
 );

--INSERTING OTHER DETAILS IN PARTYWISE RESULT
 UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


--SUM OF TOTAL SEAT WON BY EACH PARTY 
SELECT
party_alliance,
SUM (Won) AS TOTAL_SEAT_WON
FROM partywise_results
GROUP BY party_alliance
ORDER BY TOTAL_SEAT_WON DESC

--TO SEE ONLY I.N.D.I.A WON SEAT BY EACH PARTY
SELECT 
party,
won
FROM partywise_results
WHERE party_alliance = 'I.N.D.I.A'
ORDER BY won DESC

--TO SEE ONLY NDA WON SEAT BY EACH PARTY
SELECT 
party,
won
FROM partywise_results
WHERE party_alliance = 'NDA'
ORDER BY won DESC

--TO SEE ONLY OTHER WON SEAT BY EACH PARTY
SELECT 
party,
won
FROM partywise_results
WHERE party_alliance = 'OTHER'
ORDER BY won DESC

--Winning candidate's name, their party name,party allliance, total votes, and the margin of victory for a specific state and constituency?
SELECT
cr.Winning_candidate,
pr.party,
pr.party_alliance,
cr.total_votes,
cr.margin,
s.state,
cr.constituency_Name
FROM 
constituencywise_results cr INNER JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Constituency_Name = 'KOZHIKODE'

--WHAT IS THE DISTRIBUTION OF EVM VOTES V/S POSTAL VOTES FOR CANDIDATES IN SPECIFIC CONSTITUENCY?
SELECT
cd.EVM_Votes,
cd.Postal_Votes,
cd.Total_Votes,
cd.Candidate,
cr.Constituency_Name
FROM constituencywise_results cr JOIN constituencywise_details cd
ON cr.Constituency_ID = cd.Constituency_ID
WHERE cr.Constituency_Name = 'THRISSUR'


--WHICH PARTIES WON THE MOST SEAT IN A STATE, AND HOW MANY SEATS DID EACH PARTY WIN?
SELECT
  pr.party,
  COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Kerala'
GROUP BY pr.Party
ORDER BY Seats_Won

--what is the total number of seats won by each party alliance(NDA, I.N.D.I.A and OTHER) in each states for the indian election 2024
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
GROUP BY 
    s.State
ORDER BY 
    s.State

--which candidate received the highest number of EVM votes in each constituency (TOP 10)?
SELECT top 10
  cd.Candidate,
  cd.EVM_Votes,
  cd.Constituency_ID,
  cr.Constituency_Name
FROM 
  constituencywise_details cd
JOIN 
  constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
  cd.EVM_Votes = 
         (SELECT MAX (cd1.EVM_Votes)
         FROM constituencywise_details cd1
         WHERE cd1.Constituency_ID = cd.Constituency_ID
         )
ORDER BY cd.EVM_Votes DESC ;

--which candidate won and which candidate was the runnner-up in each constituency of states for the election 2024?
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Uttar Pradesh')
SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate,
    MAX(CASE WHEN rc.VoteRank = 3 THEN rc.Candidate END) AS Second_Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;

--For the state of Maharashtra, what are the total number of seats, total number of candidates, 
--total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Maharashtra';
