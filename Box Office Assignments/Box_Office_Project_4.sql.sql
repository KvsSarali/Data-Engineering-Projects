#1 Write a query to get Total films released ?
select count(distinct FilmID) Total_Films from boxoffice_tb;

#2 Write a query to get Total budget ?
select sum(BudgetinCrores) Total_Budget from boxoffice_tb; 

#3 Write a query to get Total worldwide collection ?
select sum(WorldwideCollectioninCrores) Total_worldwide_collection from boxoffice_tb; 

#4 Write a query to get Total First day collection worldwide ?
select sum(FirstDayCollectionWorldwideinCrores) Total_First_Day_worldwide_collection from boxoffice_tb; 

#5 Write a query to get Total Overseas collection ? 
select sum(OverseasCollectioninCrores) Total_Overseas_collection from boxoffice_tb; 

#6 Write a query to get Total India Gross collection ?
select sum(IndiaGrossCollectioninCrores) Total_India_Gross_collection  from boxoffice_tb; 

#7 Top 10 filmsbased on world wide collections. Display films,collections
with cte1 as (select  Title,WorldwideCollectioninCrores WWC,rank() over ( order by WorldwideCollectioninCrores desc)rnk  from boxoffice_tb)
select  Title,WWC from cte1 where rnk<=10;

#8 Total Number of films released by year
select year(ReleaseDate) Yr,count(*) Total_Films from boxoffice_tb
group by year(ReleaseDate)
order by count(*) desc;

#9 Top 10 filmsbased on india collections.Display films,collections
with cte1 as
(select title,IndiaGrossCollectioninCrores India_Collection, rank() over(order by IndiaGrossCollectioninCrores desc)rnk from boxoffice_tb)
select title,India_Collection from cte1 where rnk<=10
order by rnk;

#10 Top 10 filmsbased on overses collections.Display films,collections
with cte1 as
(select title,OverseasCollectioninCrores Oversea_Collection, rank() over(order by OverseasCollectioninCrores desc)rnk from boxoffice_tb)
select title,Oversea_Collection from cte1 where rnk<=10
order by rnk;

#11 Top 10 filmsbased on firstday collections.Display films,collections
with cte1 as
(select title,FirstDayCollectionWorldwideinCrores FirstDay_Collection, rank() over(order by FirstDayCollectionWorldwideinCrores desc)rnk from boxoffice_tb)
select title,FirstDay_Collection from cte1 where rnk<=10
order by rnk;

#12 Weekday wise films released,Display week name and no of films released
select dayname(ReleaseDate) WeekName, count(*) Total_Films from boxoffice_tb
group by dayname(ReleaseDate)
order by count(*) desc;

#13 Write a query to get OTT platofrm wise movies count
select OTT_Platform, count(*) Total_Films from boxoffice_tb
group by OTT_Platform
order by  count(*) desc;

#14 Top 10 Directors by films released
with cte1 as 
(select b.Director, count(*) Total_Films, row_number() over(order by count(*) desc ) rnk 
from boxoffice_tb a join director_tb b
on a.DirectorID=b.DirectorID
group by b.Director)
select Director, Total_Films from cte1 where rnk<=10;

#15 Top 10 directors by world wide collection 
with cte1 as 
(select b.Director, sum(WorldwideCollectioninCrores) WWC, row_number() over(order by sum(WorldwideCollectioninCrores) desc ) rnk 
from boxoffice_tb a join director_tb b
on a.DirectorID=b.DirectorID
group by b.Director)
select Director, WWC from cte1 where rnk<=10;

#16 Top10 lead actors by world wide collection
with cte1 as 
(select LeadActor_Actress, sum(WorldwideCollectioninCrores) WWC, row_number() over(order by sum(WorldwideCollectioninCrores) desc ) rnk 
from boxoffice_tb 
group by LeadActor_Actress)
select LeadActor_Actress, WWC from cte1 where rnk<=10;

#17 Top 10 movies by IMDb rating
with cte1 as 
(select Title, IMDbRating, row_number() over(order by IMDbRating desc ) rnk 
from boxoffice_tb)
select Title, IMDbRating from cte1 where rnk<=10;

#18 Bottom 10 movies by IMDb rating
with cte1 as 
(select Title, IMDbRating, row_number() over(order by IMDbRating asc ) rnk 
from boxoffice_tb)
select Title, IMDbRating from cte1 where rnk<=10;

#19 Write a query to get 5 longest run time movies
with cte1 as 
(select title,Runtime_mins,row_number() over(order by Runtime_mins desc)rnk 
from boxoffice_tb)
select Title, Runtime_mins from cte1 where rnk<=5;

#20 Write a query to get 5 shortest run time movies
with cte1 as 
(select title,Runtime_mins,row_number() over(order by Runtime_mins asc)rnk 
from boxoffice_tb)
select Title, Runtime_mins from cte1 where rnk<=5;

#21 Top7 movies by world wide collection in Bollywood
with cte1 as 
(select title,WorldwideCollectioninCrores WWC,row_number() over(order by WorldwideCollectioninCrores desc)rnk 
from boxoffice_tb where industry='Bollywood')
select Title, WWC from cte1 where rnk<=7;

#22 Top7 movies by world wide collection in Tollywood
with cte1 as 
(select title,WorldwideCollectioninCrores WWC,row_number() over(order by WorldwideCollectioninCrores desc)rnk 
from boxoffice_tb where industry='Tollywood')
select Title, WWC from cte1 where rnk<=7;

#23 Top7 movies by world wide collection in Kollywood 
with cte1 as 
(select title,WorldwideCollectioninCrores WWC,row_number() over(order by WorldwideCollectioninCrores desc)rnk 
from boxoffice_tb where industry='Kollywood')
select Title, WWC from cte1 where rnk<=7;

#24 Top7 movies by world wide collection in Sandalwood
with cte1 as 
(select title,WorldwideCollectioninCrores WWC,row_number() over(order by WorldwideCollectioninCrores desc)rnk 
from boxoffice_tb where industry='Sandalwood')
select Title, WWC from cte1 where rnk<=7;

#25 Top7 movies by world wide collection in Mollywood
with cte1 as 
(select title,WorldwideCollectioninCrores WWC,row_number() over(order by WorldwideCollectioninCrores desc)rnk 
from boxoffice_tb where industry='Mollywood')
select Title, WWC from cte1 where rnk<=7;

#26 Write query to display industry and verdict wise films count
select Industry,Verdict,count(*) TotalFilms from boxoffice_tb
group by Industry,Verdict
order by  Industry,Verdict,count(*);

#27 Write query to get films based on budget in Bollowood
select title,BudgetinCrores from boxoffice_tb where Industry='Bollywood'
order by BudgetinCrores desc;

#28 Write query to get films based on budget in Tollywood
select title,BudgetinCrores from boxoffice_tb where Industry='Tollywood'
order by BudgetinCrores desc;

#29 Write query to get films based on budget in Kollywood
select title,BudgetinCrores from boxoffice_tb where Industry='Kollywood'
order by BudgetinCrores desc;

#30 Write query to get films based on budget in Sandalwood
select title,BudgetinCrores from boxoffice_tb where Industry='Sandalwood'
order by BudgetinCrores desc;

#31 Write query to get films based on budget in Mollywood
select title,BudgetinCrores from boxoffice_tb where Industry='Mollywood'
order by BudgetinCrores desc;

#32 Top 5 movies by IMDb rating from Bollowood 
with cte1 as
(select title,IMDbRating, row_number()over(order by IMDbRating desc)rnk from boxoffice_tb 
where Industry='Bollywood')
select title,IMDbRating from cte1 where rnk<=5;

#33 Top 5 movies by IMDb rating from Kollywood
with cte1 as
(select title,IMDbRating, row_number()over(order by IMDbRating desc)rnk from boxoffice_tb 
where Industry='Kollywood')
select title,IMDbRating from cte1 where rnk<=5;

#34 Top 5 movies by IMDb rating from Tollywood 
with cte1 as
(select title,IMDbRating, row_number()over(order by IMDbRating desc)rnk from boxoffice_tb 
where Industry='Tollywood')
select title,IMDbRating from cte1 where rnk<=5;

#35 Top 5 movies by IMDb rating from Sandalwood 
with cte1 as
(select title,IMDbRating, row_number()over(order by IMDbRating desc)rnk from boxoffice_tb 
where Industry='Sandalwood')
select title,IMDbRating from cte1 where rnk<=5;

#36 Top 5 movies by IMDb rating from Mollywood
with cte1 as
(select title,IMDbRating, row_number()over(order by IMDbRating desc)rnk from boxoffice_tb 
where Industry='Mollywood')
select title,IMDbRating from cte1 where rnk<=5;

#37 Write a query to get language wise budget?
select Language,sum(BudgetinCrores) Budget
from language_tb b left join boxoffice_tb a 
on a.LanguageID=b.LanguageID
group by Language
order by sum(BudgetinCrores) desc;

#38 Write a query to get language wise how many directors are there? 
select  Language,count(DirectorID) Total_Director
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID
group by Language
order by count(DirectorID) desc;

#39 Write a query to get language wise worldwide total collection ?
select  Language,sum(WorldwideCollectioninCrores)Total_WWC 
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID
group by Language
order by sum(WorldwideCollectioninCrores) desc;

#40 Write a query to get language, lead actor/actress wise films they acted? 
select  Language,LeadActor_Actress,count(*) Total_FilmsActed
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID
group by Language,LeadActor_Actress
order by LeadActor_Actress,Language;

#41 Write a query to get language, year wise films released?
select Language,year(ReleaseDate) Yr,count(*) FilmsReleased
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID
group by Yr,Language
order by Language,Yr,count(*) desc;

#42 Write a query to get films which was not released on overseas?
select title from boxoffice_tb where OverseasCollectioninCrores =0;

#43 Write a query to get language wise top 3 longest runtime moves? 
with cte1 as 
(select Language,title,row_number() over(partition by Language order by Runtime_mins desc )rnk
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID)
select Language,title as Longest_Running_Movies from cte1 where rnk<=3;

#44 Write a query to get language wise bottom 5 shortest runtime moves?
with cte1 as 
(select Language,title as Shortest_Running_Movies,row_number() over(partition by Language order by Runtime_mins asc )rnk
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID)
select Language,Shortest_Running_Movies from cte1 where rnk<=5;

#45 Write a query to get language wise top 5 films based first day collections? 
with cte1 as 
(select Language,title as FirstDay_Collection_Movies,row_number() over(partition by Language order by FirstDayCollectionWorldwideinCrores desc )rnk
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID)
select Language,FirstDay_Collection_Movies from cte1 where rnk<=5;

#46 Write a query to get language wise top 5 films based India gross collections? 
with cte1 as 
(select Language,title as India_GrossCollection_Movies,row_number() over(partition by Language order by IndiaGrossCollectioninCrores desc )rnk
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID)
select Language,India_GrossCollection_Movies from cte1 where rnk<=5;

#47 Write a query to get language, Director wise films count? 
select Language,Director,count(*) Total_Films
from language_tb a left join boxoffice_tb b  on a.LanguageID=b.LanguageID
left join director_tb c on b.DirectorID=c.DirectorID
group by Language,Director
order by Language,Director;

#48 Write a query to get language wise OTT platofrm wise fims count? 
select Language,OTT_Platform,count(*) Total_Films
from language_tb a left join boxoffice_tb b  on a.LanguageID=b.LanguageID
group by Language,OTT_Platform
order by Language,OTT_Platform;

#49 What are top 10 fimns based language and first day collection? 
with cte1 as 
(select Language,title as FirstDay_Collection_Movies,row_number() over(partition by Language order by FirstDayCollectionWorldwideinCrores desc )rnk
from boxoffice_tb a join language_tb b
on a.LanguageID=b.LanguageID)
select Language,FirstDay_Collection_Movies from cte1 where rnk<=10;

#50 Write a query to get director wise number of fims released in from 2017 to 2019
select Director,count(*) Total_Films 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where year(ReleaseDate) between 2017 and 2019
group by Director
order by count(*) desc;

#51 Write a query to get director wise world wide collections?
select Director,SUM(WorldwideCollectioninCrores) wwc 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director
order by SUM(WorldwideCollectioninCrores) desc;

#52 Write a query to get director wise first day world wide collections?
select Director,SUM(FirstDayCollectionWorldwideinCrores) FDC_WW 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director
order by SUM(FirstDayCollectionWorldwideinCrores) desc;

#53 Write a query to get director wise India gross collections? 
select Director,SUM(IndiaGrossCollectioninCrores) IGC
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director
order by SUM(IndiaGrossCollectioninCrores) desc;

#54 Write a query to get director wise overseas collections?
select Director,SUM(OverseasCollectioninCrores) OSC
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director
order by SUM(OverseasCollectioninCrores) desc;

#55 Write a query to get director, lead actor/actress and number of films?
select Director,LeadActor_Actress,count(*) Total_Films
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director,LeadActor_Actress
order by Director,LeadActor_Actress,count(*) desc;

#56 Write a query to get films which is having budget on between 150 crores and 277 crores?
select title from boxoffice_tb where BudgetinCrores between 150 and 277
order by BudgetinCrores desc;

#57 Write a query to get director, week name wise films released?
select Director,dayname(ReleaseDate) WeekName,count(*) Total_Films
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by Director,dayname(ReleaseDate) 
order by Director,dayname(ReleaseDate) ,count(*) desc;

#58 Write a query to get OTT platofrm and director wise films released?
select OTT_Platform,Director,count(*) Total_Films
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by OTT_Platform,Director
order by OTT_Platform,Director,count(*) desc;

#59 Write a query to get director wise films released on Friday only?
select Director,count(*) Total_Films
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where dayname(ReleaseDate)='Friday'
group by Director
order by Director,count(*) desc;

#60 Write a query to get films based on IMDb reating between 6.5 and 7.7?
select title from boxoffice_tb
where IMDbRating between 6.5 and 7.7
order by IMDbRating;

#61 Write a query to get director,films and IMDb ratings? 
select Director,title,IMDbRating
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
order by Director,title,IMDbRating;

#62 Write a query to get films with highest budget based flop verdict?
select  title,BudgetinCrores from boxoffice_tb
where verdict='Flop'
order by BudgetinCrores desc;

#63 Write a query to get total number of directors?
select count(distinct DirectorID) Total_Directors from director_tb;

#64 Write a query to get vedridct wise total films released?
select verdict,count(*) Total_Films from boxoffice_tb
group by verdict
order by count(*) desc;

#65 Write a query to get top 10 directors based number of films?
with cte1 as (select director,count(*) Total_Films 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by director),
cte2 as (select director, row_number() over(order by Total_Films desc)rnk from cte1)
select director from cte2 where rnk<=10;

#66 Write a query to get top 5 directors based on world wide collections and also industry wise?
with cte1 as (select director,Industry,sum(WorldwideCollectioninCrores) WWC 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
group by director,Industry),
cte2 as (select Industry,director,WWC, row_number() over(partition by Industry order by WWC desc) rnk from cte1)
select Industry,director from cte2 where rnk<=5;

#67 Write a query to get top 3 directors based on India gross collections in Bollowood industry?
with cte1 as (select director,sum(IndiaGrossCollectioninCrores) IGC ,row_number() over(order by sum(IndiaGrossCollectioninCrores) desc) rnk 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where Industry='Bollywood'
group by director)
select director from cte1 where rnk<=3;

#68 Write a query to get top 3 directors based on India gross collections in Tollowood industry? 
with cte1 as (select director,sum(IndiaGrossCollectioninCrores) IGC ,row_number() over(order by sum(IndiaGrossCollectioninCrores) desc) rnk 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where Industry='Tollywood'
group by director)
select director from cte1 where rnk<=3;

#69 Write a query to get top 3 directors based on India gross collections in Kollowood industry? 
with cte1 as (select director,sum(IndiaGrossCollectioninCrores) IGC ,row_number() over(order by sum(IndiaGrossCollectioninCrores) desc) rnk 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where Industry='Kollywood'
group by director)
select director from cte1 where rnk<=3;

#70 Write a query to get top 3 directors based on India gross collections in Mollowood industry? 
with cte1 as (select director,sum(IndiaGrossCollectioninCrores) IGC ,row_number() over(order by sum(IndiaGrossCollectioninCrores) desc) rnk 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where Industry='Mollywood'
group by director)
select director from cte1 where rnk<=3;

#71 Write a query to get top 3 directors based on India gross collections in Sandalwood industry? 
with cte1 as (select director,sum(IndiaGrossCollectioninCrores) IGC ,row_number() over(order by sum(IndiaGrossCollectioninCrores) desc) rnk 
from director_tb a left join boxoffice_tb b
on a.DirectorID=b.DirectorID
where Industry='Sandalwood'
group by director)
select director from cte1 where rnk<=3;

#72 Write to get total number of generes?
select count(*) Total_Generes from genere_tb;

#73 Write query to get director,language,genere films count?
select director,language,Genre, count(*) Total_Films
from boxoffice_tb a  join director_tb b on a.DirectorID=b.DirectorID
join language_tb c  on a.LanguageID=c.LanguageID
join genere_tb d on  a.GenreID=d.GenreID
group by director,language,Genre
order by director,language,Genre;

#74 Write a query to genere wise budget?
select Genre, sum(BudgetinCrores) TotalBudget
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre
order by sum(BudgetinCrores) desc;

#75 Write a query to get genere wise first day worldwide collections? 
select Genre, sum(FirstDayCollectionWorldwideinCrores) FD_WWC
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre
order by sum(FirstDayCollectionWorldwideinCrores) desc;

#76 Write a query to get genere wise overseas collections? 
select Genre, sum(OverseasCollectioninCrores) OSC
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre
order by sum(OverseasCollectioninCrores) desc;

#77 Write a query to get genere wise India gross collections?
select Genre, sum(IndiaGrossCollectioninCrores) IGC
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre
order by sum(IndiaGrossCollectioninCrores) desc;

#78 Write a query to get genere wise top 2 longest run time movies?
with cte1 as(select Genre, title, Runtime_mins,row_number() over(partition by Genre order by Runtime_mins desc)rnk
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID)
select genre,title from cte1 where rnk<=2;

#79 Write a query to get genere wise bottom shortest runtime movies?
with cte1 as(select Genre, title, Runtime_mins,row_number() over(partition by Genre order by Runtime_mins asc)rnk
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID)
select genre,title from cte1 where rnk<=1;

#80 Write a query to get verdict, genere wise films released?
select Genre, verdict, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre, verdict
order by Genre, verdict;

#81 Write a query to get genere, OTT platform wise films count?
select Genre, OTT_Platform, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre, OTT_Platform
order by Genre, OTT_Platform;

#82 Write a query to get genere wise films count?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by Genre
order by count(*) desc;

#83 Write a query to get genere wise films count in Tollowood Industry?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
where industry='Tollywood'
group by Genre
order by count(*) desc;

#84 Write a query to get genere wise films count in Kollowood Industry?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
where industry='Kollywood'
group by Genre
order by count(*) desc;

#85 Write a query to get genere wise films count in Mollowood Industry?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
where industry='Mollywood'
group by Genre
order by count(*) desc;

#86 Write a query to get genere wise films count in Bollowood Industry?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
where industry='Bollywood'
group by Genre
order by count(*) desc;

#87 Write a query to get genere wise films count in Sandalwood Industry?
select Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
where industry='Sandalwood'
group by Genre
order by count(*) desc;

#88 Write a query to get lead actors/actress wise,genere and films count?
select LeadActor_Actress,Genre, count(*) TotalFilms
from boxoffice_tb a join genere_tb d on  a.GenreID=d.GenreID
group by LeadActor_Actress,Genre
order by LeadActor_Actress,Genre;

#89 Write a query to get 5th rank movie based on Worldwide total collections?
with cte1 as 
(select title, WorldwideCollectioninCrores , row_number() over(order by WorldwideCollectioninCrores desc)rnk from boxoffice_tb)
select title from cte1 where rnk=5;

#90 Write a query to get 5th rank movie by industry wise based on First day worldwide collections? 
with cte1 as 
(select title, FirstDayCollectionWorldwideinCrores , row_number() over(order by FirstDayCollectionWorldwideinCrores desc)rnk from boxoffice_tb)
select title from cte1 where rnk=5;

#91 Write a query to get 3rd rank movie by industry wise based on IMDb Ratings?
with cte1 as 
(select title,IMDbRating,industry, row_number() over(partition by industry order by IMDbRating desc)rnk from boxoffice_tb)
select title from cte1 where rnk=3;

#92 Write a stored procedure to get top 5 films based on India gross colelctions? 
delimiter $$
create procedure Top5IndianGrossCollectionMovies ()
begin
with cte1 as 
(select title,IndiaGrossCollectioninCrores, row_number() over(order by IndiaGrossCollectioninCrores desc)rnk from boxoffice_tb)
select title from cte1 where rnk<=5;
end;
$$

call Top5IndianGrossCollectionMovies();

#93 Write a stored procdure to get industry Budget and Worldwide total collections? If
#we call any industry it will display industry,budget and wordwide total
delimiter $$
create procedure GetIndustry_BudgetWWC
(in Industry_type varchar(20)
)
begin
select industry,sum(BudgetinCrores) Total_Budget,sum(WorldwideCollectioninCrores) Total_WWC from boxoffice_tb
where industry=Industry_type
group by industry;
end;
$$

call GetIndustry_BudgetWWC('Bollywood');

#94 Calculate YoY% Budget growth?
with cte1 as 
(select year(ReleaseDate) Yr,sum(BudgetinCrores) C_TotalBudget from boxoffice_tb
group by year(ReleaseDate)),
cte2 as (select *,lag(C_TotalBudget) over(order by Yr ) P_TotalBudget from cte1)
select *,  concat(((C_TotalBudget-P_TotalBudget)/P_TotalBudget)*100,' %') YOY from cte2

#95 Calculate YoY% Worldwide total collelctions growth? 
with cte1 as 
(select year(ReleaseDate) Yr,sum(WorldwideCollectioninCrores) C_WWC from boxoffice_tb
group by year(ReleaseDate)),
cte2 as (select *,lag(C_WWC) over(order by Yr ) P_WWC from cte1)
select *,  concat(((C_WWC-P_WWC)/P_WWC)*100,' %') YOY from cte2

#96 Calculate YoY% Indian Gross colelctions growth?
with cte1 as 
(select year(ReleaseDate) Yr,sum(IndiaGrossCollectioninCrores) C_IGC from boxoffice_tb
group by year(ReleaseDate)),
cte2 as (select *,lag(C_IGC) over(order by Yr ) P_IGC from cte1)
select *, concat(((C_IGC-P_IGC)/P_IGC)*100,' %') YOY from cte2

#97 Create a stored procedure to get Total films count, world wide total colelctions?
delimiter $$
create procedure Get_FilmCount_WWC()
begin
select count(*) Total_Films,sum(WorldwideCollectioninCrores) Total_WWC from boxoffice_tb;
end;
$$

call Get_FilmCount_WWC();
