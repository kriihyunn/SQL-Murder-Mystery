# SQL-Murder-Mystery

## Introduction
This is a SQL project I found online at this [link](https://mystery.knightlab.com/). Given an initial clue and a database schema, the task was to find the culprit who committed a murder in SQL City. I have included my SQL file in this project which includes extra notes of information that I wrote while discovering new pieces of information, but also wanted to include my thought process while solving this puzzle.

## Step 1 (Query 1)
We are initially given information that the murder occurred on January 15, 2018, in SQL City. From the "crime_scene_report" table I used the information to create a query that would return all murders that occurred in SQL City. From this I was given this information:
* Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

## Step 2 (Query 2 and 3)
Given 2 witnesses, I created queries to find information on both of them from the "person" table.
* Witness 1 was a man named Morty Schapiro with ID number 14887.
* Witness 2 was a woman named Annabel Miller with ID number 16371.

## Step 3 (Query 4)
Following the previous queries, I was now able to pull up their specific interview transcripts from the database "interview" by joining the tables using their unique IDs. I was able to receive crucial information that would help me in identifying the culprit in the next step.
* Morty Schapiro: I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
* Annabel Miller: I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

## Step 4 (Query 5)
Figuring out the fact that the killer went to a gym, I was now able to pull information from the "get_fit_now_check_in" and "get_fit_now_member" tables. I knew I could create a query joining the two tables together, along with adding specifics about having a gold membership, a membership status that started with 48Z, and the date the killer was seen which was 01/09. The culprit was one of 2 men:
* Joe Germuska with person_id 28819, or
* Jeremy Bowers with person_id 67318

## Step 5 (Query 6)
Now that I knew the potential culprit's name, it was time to search for information on their driver's license. From the "drivers_license" table I queried using the information found from Query 4 to find driver's licenses that included "H42W" in the license plate. I received 3 results, with 2 males and 1 female driver. I realized that I had to further specify my query to include males only. After making the change, I was able to confirm that there were 2 possible choices.

## Step 6 (Query 7, 8)
Finally, I could figure out who the murderer was. I joined the "person" and "drivers_license" tables. Based on the license plate and name, the culprit was found to be Jeremy Bowers. A check with the query provided by the website confirmed that he was indeed the killer, but the resulting message was surprisingly...
* Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.

## Step 6.5 (Query 9)
I realized after finishing the previous queries and finding the culprit that I could have completed the task by doing a double join between the "person", "drivers_license", and "get_fit_now_member" tables since they share primary and foreign keys. I thought it was interesting and wanted to include this query because it goes on to show that people can think about how to solve the task in different ways and still achieve the same results. The query can be viewed in my SQL script file. Using this query replaces queries 5-7.

## Step 7 (Query 10, 11)
Confirming that the killer was Jeremy Bowers and given a post-end challenge, it was easy to pull up Jeremy Bower's interview transcript from the "interview" table since we knew his person_id from Step 4. His testimony confessed:
* I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

This introduced the use of the new table "facebook_event_checkin". Luckily, I could create a double join query since it shared primary and foreign keys with the "person" and "drivers_license" table. The result was:
* Miranda Priestly

Adding the name to the final query provided by the website to check if I was right:
* Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!

I was successfully able to find the mastermind with 2 queries and complete the puzzle!

## Conclusion
I genuinely enjoyed solving this challenge as it really tested my knowledge on databases and SQL. I was able to refresh my memory on primary/forieign keys, joins, aggregate functions, and more. Given the clues, I had to logically think about which data to use and eventually was about to arrive at the correct conclusion and solve the mystery. Through this project, I was able to improve my critical thinking skills and became more confident about my SQL skills. Thank you to Knight Lab for providing this exercise.
