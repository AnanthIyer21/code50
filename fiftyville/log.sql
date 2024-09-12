-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Find the description of the crime scene on 7th July 2023 on Humphrey Street
SELECT description FROM crime_scene_reports
WHERE month = 7 AND day = 28 AND street = 'Humphrey Street'
-- From this, two descriptions were found - one of theft at 10:15am at the bakery. Three witnesses were interviewed - each transcript mentions the bakery. The other description was about littering with no witnesses; this is probably not that important.
-- Find the names and descriptions from the relevant interviews
SELECT name, transcript FROM interviews
WHERE year = 2023 AND month = 7 AND day = 28;
-- Three relevant witnesses found as mentioned before
-- Ruth - within 10 mins of the theft, theif got into a car and drove away, security footage is useful during that time frame - 10:15 to 10:25
-- Eugene - recognised the thief. walking by the ATM on leggett street and saw the thief withdraw money
-- Raymond - thief called someone and spoke for less than 1 min. Planning to take the earliest flight to fiftyville tomorrow. The person on the other end purchased the tickets.
-- Use Ruth's information to find the licence plates of all the cars which left between 10:15 and 10:25
SELECT licence_plate, activity FROM bakery_security_logs
WHERE year = 2023 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 25 AND activity = 'exit';
-- There were 7 licence plates matching this description - 5P2BI95, 94KL13X, 6P58WS2, 4328GD8, G412CB7, L93JTIZ, 322W7JE, 0NTHK55
-- Using Eugenes information, find the account number and amount the thief withdrew
select account_number from atm_transactions
where year = 2023 and month = 7 and day = 28 and atm_location = 'Leggett Street' and transaction_type = 'withdraw';
-- There were 7 account numbers involved here - 28500762, 28296815, 76054385, 49610011, 16153065, 25506511, 81061156, 26013199
-- Using Raymond's information, find information about the caller and receiver of the call
select caller, receiver from phone_calls
where year = 2023 and month = 7 and day = 28 and duration < 60;
-- There were 9 such calls - (130) 555-0289 | (996) 555-8899, (499) 555-9472 | (892) 555-8872, (367) 555-5533 | (375) 555-8161, (499) 555-9472 | (717) 555-1342, (286) 555-6063 | (676) 555-6554, (770) 555-1861 | (725) 555-3243, (031) 555-6622 | (910) 555-3251, (826) 555-1652 | (066) 555-9701, (338) 555-6650 | (704) 555-2131
-- Using Raymond's information find information about the flights
select city from airports
where id in (
    select destination_airport_id from flights
    where origin_airport_id = (
        select id from airports where city = 'Fiftyville')
        and day = 29 and year = 2023 and month = 7);
-- There were 5 possible destinations - Chicago, New York City, Boston, Tokyo, or San Francisco
-- There were 7 licence plates matching this description - 5P2BI95, 94KL13X, 6P58WS2, 4328GD8, G412CB7, L93JTIZ, 322W7JE, 0NTHK55
-- There were 7 account numbers involved here - 28500762, 28296815, 76054385, 49610011, 16153065, 25506511, 81061156, 26013199
-- There were 9 such calls - (130) 555-0289 | (996) 555-8899, (499) 555-9472 | (892) 555-8872, (367) 555-5533 | (375) 555-8161, (499) 555-9472 | (717) 555-1342, (286) 555-6063 | (676) 555-6554, (770) 555-1861 | (725) 555-3243, (031) 555-6622 | (910) 555-3251, (826) 555-1652 | (066) 555-9701, (338) 555-6650 | (704) 555-2131
select name from people
where phone_number in (select caller from phone_calls where year = 2023 and month = 7 and day = 28 and duration < 60)
and passport_number in (select passport_number from passengers where flight_id in (
select id from flights where origin_airport_id = (select id from airports where city = 'Fiftyville') and
destination_airport_id in (select id from airports where city in ('Chicago', 'New York City', 'Boston', 'Tokyo', 'San Francisco'))
and year = 2023 and month = 7 and day = 29)) and
license_plate in (select license_plate from bakery_security_logs where year = 2023 and day = 28 and hour = 10 and minute >= 15 and minute <= 25 and activity = 'exit');
-- There are four possible people - Sofia, Diana, Kelsey, or Bruce after filtering through destinations, license plates, and calls.
select name from people
where id in (select person_id from bank_accounts where account_number in (28500762, 28296815, 76054385, 49610011, 16153065, 25506511, 81061156, 26013199));
-- After filtering through the bank accounts as well, I can see that there are two people here common - Diana, and Bruce.
select city from airports
where id = (
    select destination_airport_id from flights where id = (
        select flight_id from passengers where passport_number = (
            select passport_number from people where name = 'Bruce'
)))
-- We now know that Bruce flew to new york
-- Using a slight adjustment in code, we know that diana flew to boston
select city from airports
where id = (
    select destination_airport_id from flights where id = (
        select flight_id from passengers where passport_number = (
            select passport_number from people where phone_number = (
                select receiver from phone_calls where caller = (
                    select phone_number from people where name = 'Bruce'
)))));
-- We know bruce's Accomplice also flew to new york like bruce
-- The person diana called didn't fly that day hence bruce is the thief.
select name from people
where phone_number = (
    select receiver from phone_calls where caller = (
        select phone_number from people where name = 'Bruce'
));
-- Bruce's accomplice is Pamela
