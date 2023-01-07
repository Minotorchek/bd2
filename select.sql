select name, date1 from alboms
where date1 between '01.01.2018' and '31.12.2018';

select music, duration from music
order by duration desc
limit 1;

select music from music
where duration >= '210';

select distinct compilationname from compilations
where date1 between '01.01.2018' and '31.12.2020';

select name1 from performers
where not name1 like '% %';

select music from music
where music like '%my%';