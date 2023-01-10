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

select g.genre, count(g.genre) from genre as g
left join interval1 as i1 on g.id = i1.genre_id
left join performers as p on i1.performers_id = p.id
group by g.genre
order by count(p.id) desc;

select m.music, a.date1 from alboms as a
left join music as m on m.albom_id = a.id
where (a.date1 >= '01.01.2019') and (a.date1 <= '31.12.2020');

select a.name, AVG(m.duration)
from alboms as a
left join music m on m.albom_id = a.id
group by a.name
order by AVG(m.duration);

select distinct p.name1
from performers as p
where p.name1 not in (
    select distinct p.name1
    from performers as p2
    left join interval2 as i2 on p.id = i2.performers_id
    left join alboms as a on a.id = i2.albom_id
    where a.date1 between '01.01.2020' and '31.12.2020'
)
order by p.name1;

select distinct c.compilationname 
from compilations c 
left join interval3 i3 on c.id = i3.compilations_id 
left join music m  on m.id = i3.music_id
left join alboms as a on a.id = m.albom_id
left join interval2 i2 on i2.albom_id = a.id
left join performers p on p.id = i2.performers_id
where p.name1 like '%%Джарахов%%'
order by c.compilationname;

select 	a.name
from alboms as a
left join interval2 i2 on a.id = i2.albom_id
left join performers p on p.id = i2.performers_id
left join interval1 i1 on p.id = i1.performers_id
left join genre g on g.id = i1.genre_id
group by a.name
having count(distinct g.genre) > 1
order by a.name;

select m.music
from music m
left join interval3 i3 on m.id = i3.music_id
where i3.music_id is null;

select p.name1, m.duration
from music m 
left join alboms as a on a.id = m.id
left join interval2 i2 on i2.albom_id = a.id
left join performers p on p.id = i2.performers_id
group by p.name1, m.duration
having m.duration = (select min(duration) from music)
order by p.name1;

select distinct a.name
from alboms as a
left join music m on m.albom_id = a.id
where m.albom_id in (
    select albom_id
    from music
    group by albom_id
    having count(id) = (
        select count(id)
        from music
        group by albom_id
        order by count
        limit 1
    )
)
order by a.name