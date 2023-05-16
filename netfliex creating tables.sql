create table country_produced (
[country] varchar(1000),
country_key int
)
--truncate table country_produced
--select * from country_produced
INSERT INTO country_produced (country, country_key)
VALUES (
 ('Albania')	,1),
 ('Algeria',2),
 ('Angola',3),
  ('Argentina',4),

('Armenia',	5),
('Australia',	6),
('Austria',	7),
('Azerbaijan',	8),
('Bahamas',	9),
('Bangladesh',	10),
('Belarus',	11),
('Bermuda',	12),
('Botswana',	13),
('Brazil',	14),
('Bulgaria',	15),
('Cambodia',	16),
('Cameroon',	17),
('Canada',	18),
('Cayman Islands',	19),
('Chile',	20),
('China',	21),
('Colombia',	22),
('Croatia',	23),
('Cuba',	24),
('Cyprus',	25),
('Denmark',	26),
('Dominican Republic',	27),
('Ecuador',	28),
('Egypt',	29),
('Finland',	30),
('France',	31),
('Georgia',	32),
('Germany',	33),
('Ghana',	34),
('Greece',	35),
('Guatemala',	36),
('Hong Kong',	37),
('Hungary',	38),
('Iceland',	39),
('India',	40),
('Indonesia',	41),
('Iran',	42),
('Iraq',	43),
('Ireland',	44),
('Israel',	45),
('Italy',	46),
('Jamaica',	47),
('Jordan',	48),
('Kazakhstan',	49),
('Kenya',	50),
('Kuwait',	51),
('Latvia',	52),
('Lebanon',	53),
('Liechtenstein',	54),
('Luxembourg',	55),
('Malawi',	56),
('Malaysia',	57),
('Malta',	58),
('Mauritius',	59),
('Mongolia',	60),
('Montenegro',	61),
('Morocco',	62),
('Mozambique',	63),
('Namibia',	64),
('Nepal',	65),
('Netherlands',	66),
('New Zealand',	67),
('Nicaragua',	68),
('Nigeria',	69),
('Norway',	70),
('Pakistan',	71),
('Palestine',	72),
('Panama',	73),
('Paraguay',	74),
('Peru',	75),
('Philippines',	76),
('Poland',	77),
('Portugal',	78),
('Puerto Rico',	79),
('Qatar',	80),
('Romania',	81),
('Russia',	82),
('Samoa',	83),
('Saudi Arabia',	84),
('Senegal',	85),
('Serbia',	86),
('Singapore',	87),
('Slovakia',	88),
('Slovenia',	89),
('South Africa',	90),
('South Korea',	91),
('Soviet Union',	92),
('Spain',	93),
('Sri Lanka',	94),
('Sweden',	95),
('Switzerland',	96),
('Syria',	97),
('Taiwan',	98),
('Thailand',	99),
('Turkey',	100),
('Uganda',	101),
('Ukraine',	102),
('United Arab Emirates',	103),
('United Kingdom',	104),
('United States',	105),
('Uruguay',	106),
('Vatican City',	107),
('Venezuela',	108),
('Vietnam',	109),
('West Germany',	110),
('Zimbabwe',	111),
('Burkina Faso',	112),
('Ethiopia',	113),
('Czech Republic',	114),
('Mexico',	115),
('Japan',	116),
('Belgium',	117)
----------------------------------------------------------
--select * from Genere_tab
create table Genere_tab (
[Genere] varchar(60),
Genere_key int
)
----
INSERT INTO Genere_tab (Genere, Genere_key)
VALUES (


 ('Documentaries'),	1),
('International TV Shows',	2),
('TV Dramas',	3),
('TV Mysteries',	4),
('Romantic TV Shows',	5),
('TV Comedies',	6),
('Dramas',	7),
('Independent Movies',	8),
('International Movies',	9),
('British TV Shows',	10),
('Reality TV',	11),
('Comedies',	12),
('Crime TV Shows',	13),
('Spanish-Language TV Shows',	14),
('TV Action & Adventure',	15),
('Romantic Movies',	16),
('Docuseries',	17),
('Horror Movies',	18),
('Sci-Fi & Fantasy',	19),
('Thrillers',	20),
('Kids'' TV',	21),
('Action & Adventure',	22),
('TV Sci-Fi & Fantasy',	23),
('Classic Movies',	24),
('Anime Features',	25),
('Anime Series',	26),
('Children & Family Movies',	27),
('Music & Musicals',	28),
('Sports Movies',	29),
('Korean TV Shows',	30),
('Teen TV Shows',	31),
('Cult Movies',	32),
('Faith & Spirituality',33),
('LGBTQ Movies',	34),
('TV Horror',	35),
('Stand-Up Comedy',	36),
('TV Shows',	37),
('Movies',	38),
('Classic & Cult TV',	39),
('Science & Nature TV',	40),
('TV Thrillers',	41),
('Stand-Up Comedy & Talk Shows',	42)
-------------------------------------------
--select * from date_tab truncate table date_tab
create table date_tab (
date_added date
,year int
,month smallint
,day int
,week_num int
,Quarter int
,day_name varchar(10)
,is_weekend varchar(2)
)
---------------------------
INSERT INTO date_tab
select 
--MIN(CONVERT(date,[date_added],110)) AS [Min Date] 
--,MAX(CONVERT(date,[date_added],110)) AS [Min Date] 
 COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))) AS date_added 
,datepart(year,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as year
,datepart(month,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as month
,datepart(DAY,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as day
,datepart(wk,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as week_num
,datepart(QUARTER,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as Quarter
,datename(WEEKDAY,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110))))) as day_name
,case when datename(WEEKDAY,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110)))))='Saturday' then 'Y'
	  when datename(WEEKDAY,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110)))))='Friday'   then 'Y'
	  when datename(WEEKDAY,(COALESCE(DATEADD(day, -1, LEAD(MIN(CONVERT(date,[date_added],110))) OVER (PARTITION BY show_id ORDER BY MIN(CONVERT(date,[date_added],110)))), MAX(CONVERT(date,[date_added],110)))))='Thursday' then 'Y'
	  else 'N' end as is_weekend
from [Netflix].[dbo].[netflix_titles_UTF8] 
GROUP BY show_id, YEAR(CONVERT(date,[date_added],110))
order by 1 desc;
-----------------
---------------//explain running date:
				--SELECT ID, Points
				--, MIN([Date]) AS [Min Date] 
				--, COALESCE(DATEADD(day, -1, LEAD(MIN([Date])) OVER (PARTITION BY ID ORDER BY MIN([Date]))), MAX([Date])) AS [Max Date] 
				--FROM your_table
				--GROUP BY ID, Points, YEAR([Date]);
----------------
select * from Type_tab
create table Type_tab (
Type varchar(10),
Type_key int
)

INSERT INTO Type_tab values (
 ('Movie'),	1),  ('TV Show',	2)
----------------

-- create table rating (
--Type varchar(10),
--Type_key int
--)
------------------------
truncate table netflix_fixed
create table netflix_fixed (
show_id varchar(10)
,[type] varchar(8)
,min_or_season int
,[title] varchar(200)
,[director] varchar(1000)
,date_added date
,[release_year] int
,[rating] varchar(20)
,Genere varchar(50)
,Country varchar(25)
,country_key int
,actors varchar(120)
,[description] varchar(1000)
)

insert into netflix_fixed
select show_id=trim(show_id)
	  ,[type]=trim([type])
	 -- ,[duration] --converted to  min_or_season
	  ,trim(SUBSTRING([duration], 1, PATINDEX('%[^0-9]%',trim([duration])))) as min_or_season
	--  ,trim(SUBSTRING([duration], 1, len([duration])-PATINDEX('% min%',[duration]))) as defewf
	  --,REVERSE([duration])
	  --,left(TRIM([duration]),4) duration_num
	  --,trim(SUBSTRING(trim([duration]), 1, len(trim([duration]))-PATINDEX('% %',trim([duration])))) as defewf
       ,[title]=trim([title])
      ,[director]=  case when [director] is null then 'No director data'
						 else [director] end
      --,[country]
     -- ,[date_added]
	 ,CONVERT(date,[date_added],110)  as date_added
	-- ,DATEPART(MM,TRIM([date_added])) as check_date_mm
	-- ,DATEPART(YY,TRIM([date_added])) as check_date_yy
	-- ,DATEPART(DD,TRIM([date_added])) as check_date_dd
      ,[release_year]
      ,[rating]= case when [rating] like '%min%' then 'NO rating data' 
					  when  [rating] is null then 'NO rating data' --([rating],'NO rating data') 
					  else [rating] end
--      ,[listed_in] //converted to Genere
	  ,TRIM(cs_listed_in.Value) as Genere
	  ,TRIM(cs.Value) as 'Country'--SplitData
	  ,country_key=case
when TRIM(cs.Value)='Albania'then	1
when TRIM(cs.Value)='Algeria'then	2
when TRIM(cs.Value)='Angola'then	3
when TRIM(cs.Value)='Argentina'then	4
when TRIM(cs.Value)='Armenia'then	5
when TRIM(cs.Value)='Australia'then	6
when TRIM(cs.Value)='Austria'then	7
when TRIM(cs.Value)='Azerbaijan'then	8
when TRIM(cs.Value)='Bahamas'then	9
when TRIM(cs.Value)='Bangladesh'then	10
when TRIM(cs.Value)='Belarus'then	11
when TRIM(cs.Value)='Bermuda'then	12
when TRIM(cs.Value)='Botswana'then	13
when TRIM(cs.Value)='Brazil'then	14
when TRIM(cs.Value)='Bulgaria'then	15
when TRIM(cs.Value)='Cambodia'then	16
when TRIM(cs.Value)='Cameroon'then	17
when TRIM(cs.Value)='Canada'then	18
when TRIM(cs.Value)='Cayman Islands'then	19
when TRIM(cs.Value)='Chile'then	20
when TRIM(cs.Value)='China'then	21
when TRIM(cs.Value)='Colombia'then	22
when TRIM(cs.Value)='Croatia'then	23
when TRIM(cs.Value)='Cuba'then	24
when TRIM(cs.Value)='Cyprus'then	25
when TRIM(cs.Value)='Denmark'then	26
when TRIM(cs.Value)='Dominican Republic'then	27
when TRIM(cs.Value)='Ecuador'then	28
when TRIM(cs.Value)='Egypt'then	29
when TRIM(cs.Value)='Finland'then	30
when TRIM(cs.Value)='France'then	31
when TRIM(cs.Value)='Georgia'then	32
when TRIM(cs.Value)='Germany'then	33
when TRIM(cs.Value)='Ghana'then	34
when TRIM(cs.Value)='Greece'then	35
when TRIM(cs.Value)='Guatemala'then	36
when TRIM(cs.Value)='Hong Kong'then	37
when TRIM(cs.Value)='Hungary'then	38
when TRIM(cs.Value)='Iceland'then	39
when TRIM(cs.Value)='India'then	40
when TRIM(cs.Value)='Indonesia'then	41
when TRIM(cs.Value)='Iran'then	42
when TRIM(cs.Value)='Iraq'then	43
when TRIM(cs.Value)='Ireland'then	44
when TRIM(cs.Value)='Israel'then	45
when TRIM(cs.Value)='Italy'then	46
when TRIM(cs.Value)='Jamaica'then	47
when TRIM(cs.Value)='Jordan'then	48
when TRIM(cs.Value)='Kazakhstan'then	49
when TRIM(cs.Value)='Kenya'then	50
when TRIM(cs.Value)='Kuwait'then	51
when TRIM(cs.Value)='Latvia'then	52
when TRIM(cs.Value)='Lebanon'then	53
when TRIM(cs.Value)='Liechtenstein'then	54
when TRIM(cs.Value)='Luxembourg'then	55
when TRIM(cs.Value)='Malawi'then	56
when TRIM(cs.Value)='Malaysia'then	57
when TRIM(cs.Value)='Malta'then	58
when TRIM(cs.Value)='Mauritius'then	59
when TRIM(cs.Value)='Mongolia'then	60
when TRIM(cs.Value)='Montenegro'then	61
when TRIM(cs.Value)='Morocco'then	62
when TRIM(cs.Value)='Mozambique'then	63
when TRIM(cs.Value)='Namibia'then	64
when TRIM(cs.Value)='Nepal'then	65
when TRIM(cs.Value)='Netherlands'then	66
when TRIM(cs.Value)='New Zealand'then	67
when TRIM(cs.Value)='Nicaragua'then	68
when TRIM(cs.Value)='Nigeria'then	69
when TRIM(cs.Value)='Norway'then	70
when TRIM(cs.Value)='Pakistan'then	71
when TRIM(cs.Value)='Palestine'then	72
when TRIM(cs.Value)='Panama'then	73
when TRIM(cs.Value)='Paraguay'then	74
when TRIM(cs.Value)='Peru'then	75
when TRIM(cs.Value)='Philippines'then	76
when TRIM(cs.Value)='Poland'then	77
when TRIM(cs.Value)='Portugal'then	78
when TRIM(cs.Value)='Puerto Rico'then	79
when TRIM(cs.Value)='Qatar'then	80
when TRIM(cs.Value)='Romania'then	81
when TRIM(cs.Value)='Russia'then	82
when TRIM(cs.Value)='Samoa'then	83
when TRIM(cs.Value)='Saudi Arabia'then	84
when TRIM(cs.Value)='Senegal'then	85
when TRIM(cs.Value)='Serbia'then	86
when TRIM(cs.Value)='Singapore'then	87
when TRIM(cs.Value)='Slovakia'then	88
when TRIM(cs.Value)='Slovenia'then	89
when TRIM(cs.Value)='South Africa'then	90
when TRIM(cs.Value)='South Korea'then	91
when TRIM(cs.Value)='Soviet Union'then	92
when TRIM(cs.Value)='Spain'then	93
when TRIM(cs.Value)='Sri Lanka'then	94
when TRIM(cs.Value)='Sweden'then	95
when TRIM(cs.Value)='Switzerland'then	96
when TRIM(cs.Value)='Syria'then	97
when TRIM(cs.Value)='Taiwan'then	98
when TRIM(cs.Value)='Thailand'then	99
when TRIM(cs.Value)='Turkey'then	100
when TRIM(cs.Value)='Uganda'then	101
when TRIM(cs.Value)='Ukraine'then	102
when TRIM(cs.Value)='United Arab Emirates'then	103
when TRIM(cs.Value)='United Kingdom'then	104
when TRIM(cs.Value)='United States'then	105
when TRIM(cs.Value)='Uruguay'then	106
when TRIM(cs.Value)='Vatican City'then	107
when TRIM(cs.Value)='Venezuela'then	108
when TRIM(cs.Value)='Vietnam'then	109
when TRIM(cs.Value)='West Germany'then	110
when TRIM(cs.Value)='Zimbabwe'then	111

when TRIM(cs.Value)='Burkina Faso'then	112
when TRIM(cs.Value)='Ethiopia'then	113
when TRIM(cs.Value)='Czech Republic'then	114
when TRIM(cs.Value)='Mexico'then	115
when TRIM(cs.Value)='Japan'then	116
when TRIM(cs.Value)='Belgium'then	117

end
,case when [cast] is null then 'No cast data'
			else TRIM(cs_cast.Value) end as actors
,[description]=trim([description])
--,[cast]=  case when [cast] is null then 'No cast data'
--						 else [cast] end


from [Netflix].[dbo].[netflix_titles_UTF8]
cross apply STRING_SPLIT ([country], ',') cs
cross apply STRING_SPLIT ([listed_in], ',') cs_listed_in
cross apply STRING_SPLIT ([cast], ',') cs_cast
