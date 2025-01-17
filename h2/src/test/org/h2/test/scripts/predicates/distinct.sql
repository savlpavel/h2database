-- Copyright 2004-2025 H2 Group. Multiple-Licensed under the MPL 2.0,
-- and the EPL 1.0 (https://h2database.com/html/license.html).
-- Initial Developer: H2 Group
--

-- Quantified distinct predicate

SELECT 1 IS DISTINCT FROM ALL(VALUES 1, NULL, 2);
>> FALSE

SELECT 1 IS DISTINCT FROM ALL(VALUES NULL, 2);
>> TRUE

SELECT NULL IS DISTINCT FROM ALL(VALUES 1, NULL, 2);
>> FALSE

SELECT NULL IS DISTINCT FROM ALL(VALUES 1, 2);
>> TRUE

SELECT 1 IS NOT DISTINCT FROM ALL(VALUES 1, NULL, 2);
>> FALSE

SELECT 1 IS NOT DISTINCT FROM ALL(VALUES 1, 1);
>> TRUE

SELECT NULL IS NOT DISTINCT FROM ALL(VALUES 1, NULL, 2);
>> FALSE

SELECT NULL IS NOT DISTINCT FROM ALL(VALUES NULL, NULL);
>> TRUE

SELECT 1 IS DISTINCT FROM ANY(VALUES 1, NULL, 2);
>> TRUE

SELECT 1 IS DISTINCT FROM ANY(VALUES 1, 1);
>> FALSE

SELECT NULL IS DISTINCT FROM ANY(VALUES 1, NULL, 2);
>> TRUE

SELECT NULL IS DISTINCT FROM ANY(VALUES NULL, NULL);
>> FALSE

SELECT 1 IS NOT DISTINCT FROM ANY(VALUES 1, NULL, 2);
>> TRUE

SELECT 1 IS NOT DISTINCT FROM ANY(VALUES NULL, 2);
>> FALSE

SELECT NULL IS NOT DISTINCT FROM ANY(VALUES 1, NULL, 2);
>> TRUE

SELECT NULL IS NOT DISTINCT FROM ANY(VALUES 1, 2);
>> FALSE

SELECT NOT (NULL IS NOT DISTINCT FROM ANY(VALUES 1, 2));
>> TRUE

EXPLAIN SELECT NOT (NULL IS NOT DISTINCT FROM ANY(VALUES 1, 2));
>> SELECT NOT (NULL IS NOT DISTINCT FROM ANY( VALUES (1), (2)))

SELECT (1, NULL) IS NOT DISTINCT FROM ANY(VALUES (1, NULL), (2, NULL));
>> TRUE

SELECT (1, NULL) IS NOT DISTINCT FROM ANY(VALUES (2, NULL), (3, NULL));
>> FALSE
