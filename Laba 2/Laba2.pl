%%%%% floor - 1,2,3,4 or 5 %%%%%
floor(malezhElizaveta,1).
floor(sokolovDaniel,1).
floor(kurchenkoEkaterina,2).
floor(miroshnichenkoArtem,2).
floor(bolotskiyDmitriy,3).
floor(sapunovaAlexandra,3).

floor(kondratenkoDanna,1).
floor(antonyukViktoriya,1).
floor(zhdanovVadim,2).
floor(eremenkoKirill,2).
floor(saenkoIlya,3).
floor(zhaldakovVitaliy,3).

floor(alekseevDmitriy,1).
floor(gapochkaVladislav,1).
floor(golidovaVeronika,2).
floor(zhushmanZahar,2).
floor(kondratyevAndrey,3).
floor(konchenkoLeonid,3).

floor(anInessa,1).
floor(ereminAlexey,1).
floor(ignatyevaMaria,2).
floor(larionovAndrey,2).
floor(nazarovGeorgiy,3).
floor(tarshilovViktor,3).


%%%%% gender - male(1) or female(2) %%%%%
gender(malezhElizaveta,2).
gender(sokolovDaniel,1).
gender(kurchenkoEkaterina,2).
gender(miroshnichenkoArtem,1).
gender(bolotskiyDmitriy,1).
gender(sapunovaAlexandra,2).

gender(kondratenkoDanna,2).
gender(antonyukViktoriya,2).
gender(zhdanovVadim,1).
gender(eremenkoKirill,1).
gender(saenkoIlya,1).
gender(zhaldakovVitaliy,1).

gender(alekseevDmitriy,1).
gender(gapochkaVladislav,1).
gender(golidovaVeronika,2).
gender(zhushmanZahar,1).
gender(kondratyevAndrey,1).
gender(konchenkoLeonid,1).

gender(anInessa,0).
gender(ereminAlexey,1).
gender(ignatyevaMaria,2).
gender(larionovAndrey,1).
gender(nazarovGeorgiy,1).
gender(tarshilovViktor,1).


%%%%% group number - 26/1(1), 26/2(2), 29/1(3) or 29/2(4) %%%%%
group(malezhElizaveta,2).
group(sokolovDaniel,2).
group(kurchenkoEkaterina,2).
group(miroshnichenkoArtem,2).
group(bolotskiyDmitriy,2).
group(sapunovaAlexandra,2).

group(kondratenkoDanna,1).
group(antonyukViktoriya,1).
group(zhdanovVadim,1).
group(eremenkoKirill,1).
group(saenkoIlya,1).
group(zhaldakovVitaliy,1).

group(alekseevDmitriy,3).
group(gapochkaVladislav,3).
group(golidovaVeronika,3).
group(zhushmanZahar,3).
group(kondratyevAndrey,3).
group(konchenkoLeonid,3).

group(anInessa,4).
group(ereminAlexey,4).
group(ignatyevaMaria,4).
group(larionovAndrey,4).
group(nazarovGeorgiy,4).
group(tarshilovViktor,4).


%%%%% bed by the window - got it(1) or not(2) %%%%%
bed_by_the_window(malezhElizaveta,1).
bed_by_the_window(sokolovDaniel,2).
bed_by_the_window(kurchenkoEkaterina,1).
bed_by_the_window(miroshnichenkoArtem,2).
bed_by_the_window(bolotskiyDmitriy,1).
bed_by_the_window(sapunovaAlexandra,2).

bed_by_the_window(kondratenkoDanna,1).
bed_by_the_window(antonyukViktoriya,2).
bed_by_the_window(zhdanovVadim,1).
bed_by_the_window(eremenkoKirill,2).
bed_by_the_window(saenkoIlya,1).
bed_by_the_window(zhaldakovVitaliy,2).

bed_by_the_window(alekseevDmitriy,1).
bed_by_the_window(gapochkaVladislav,2).
bed_by_the_window(golidovaVeronika,1).
bed_by_the_window(zhushmanZahar,2).
bed_by_the_window(kondratyevAndrey,1).
bed_by_the_window(konchenkoLeonid,2).

bed_by_the_window(anInessa,1).
bed_by_the_window(ereminAlexey,2).
bed_by_the_window(ignatyevaMaria,1).
bed_by_the_window(larionovAndrey,2).
bed_by_the_window(nazarovGeorgiy,1).
bed_by_the_window(tarshilovViktor,2).

question1(X1):-	write("What is student's floor?"),nl,
			write("1. First floor"),nl,
			write("2. Second floor"),nl,
    			write("3. Third floor"),nl,
			write("4. Fourth floor"),nl,
    			write("5. Fifth floor"),nl,
				read(X1).

question2(X2):-	write("What is student's gender?"),nl,
			write("1. Male"),nl,
			write("2. Female"),nl,
			read(X2).

question3(X3):-	write("What is student's group?"),nl,
			write("1. 26/1"),nl,
			write("2. 26/2"),nl,
    			write("3. 29/1"),nl,
			write("4. 29/2"),nl,
			read(X3).

question4(X4):-	write("Is student's bed located by the window?"),nl,
			write("1. Yes, it is"),nl,
			write("2. No, it isn't"),nl,
			read(X4).

pr:-		question1(X1),question2(X2),question3(X3),question4(X4),
		floor(X,X1),gender(X,X2),group(X,X3),bed_by_the_window(X,X4),
		write(X).