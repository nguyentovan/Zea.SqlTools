-- Zea formatter corpus for the soql dialect. Format each marked case independently.
-- Cases under invalid/ contain deliberate syntax errors.

-- zea-case: select/simple-filter
-- zea-expect: ["SELECT Id","FROM Account","WHERE Name = 'Example'"]
select Id from Account where Name='Example'

-- zea-case: query/relationship-fields
select Id, Account.Name from Contact where LastName like 'Nguyen%' order by CreatedDate desc limit 10

-- zea-case: query/parent-to-child
select Id, (select Id, LastName from Contacts order by LastName) from Account

-- zea-case: query/relative-date
select Id from Opportunity where CloseDate = YESTERDAY and IsClosed = false

-- zea-case: query/relative-date-with-count
-- zea-expect: ["SELECT Id","FROM Opportunity","WHERE CloseDate = LAST_N_DAYS:30","    AND IsClosed = FALSE"]
select Id from Opportunity where CloseDate = LAST_N_DAYS:30 and IsClosed = false

-- zea-case: query/aggregate
select StageName, count(Id) from Opportunity group by StageName having count(Id) > 10

-- zea-case: invalid/unclosed-parenthesis
select Id from Account where (Name = 'Example'
