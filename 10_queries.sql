--Query 1: join , group by
SELECT country, Cumulative_Doses from(
select location_name as Country, sum(total_vaccinations) as Cumulative_Doses
FROM covid.vaccination
INNER JOIN covid.locations
on locations.location_id = Vaccination.location_id
group by location_name) as t1
where Cumulative_Doses > (select avg(total_vaccinations) from covid.vaccination);


--Query 2 : join, order
SELECT location_name as Country , vaccine_name as Type
from covid.vaccination_location
inner join covid.locations
on locations.location_id = vaccination_location.location_id
inner join covid.vaccines
on vaccines.vaccine_id = vaccination_location.vaccine_id
order by location_name;


--Query 3 : inner join
Select date_vaccine as date1, location_name as Country, sum(total_vaccinations) as Administered_Vaccine
from covid.vaccination
inner join covid.locations
on locations.location_id =vaccination.location_id
group by date_vaccine,location_name;

-- Query 4; sub query
select * from covid.vaccines
 where vaccines.vaccine_id not in (select vaccine_id from covid.vaccination)
 
 
--Query 5:

with cte as (
    select location_name, iso_code, vaccine_name, total_supplied
    from covid.vaccination_location
    inner join covid.locations
    on locations.location_id = vaccination_location.location_id
    inner join covid.vaccines
    on vaccines.vaccine_id = vaccination_location.vaccine_id
)
select * from cte;


--Query 6:
select location_name,sum(total_vaccinations) from covid.vaccination
 inner join covid.locations
 on locations.location_id = vaccination.location_id
 group by location_name
 having sum(total_vaccinations)>10;
 


-- Query 7:
select vaccine_name, sum(total_supplied) total_supply from covid.vaccination_location
inner join covid.vaccines
on vaccines.vaccine_id = vaccination_location.vaccine_id
where vaccine_name = 'Sputnik V'
group by vaccine_name;


--Query 8:
select vaccine_name, sum(total_supplied) total_supply from covid.vaccination_location
inner join covid.vaccines
on vaccines.vaccine_id = vaccination_location.vaccine_id
group by vaccine_name
having sum(total_supplied)>100;

-- Query 9: top 5 vaccinations

select vaccine_name,sum(total_vaccinations) from covid.vaccination
 inner join covid.vaccines
 on vaccines.vaccine_id = vaccination.vaccine_id
 group by vaccine_name
 order by sum(total_vaccinations) desc
 limit 5;
 
 
 --Query 10;

select * from covid.vaccines
inner join covid.vaccination
on vaccination.vaccine_id = vaccines.vaccine_id
where total_vaccinations >10;