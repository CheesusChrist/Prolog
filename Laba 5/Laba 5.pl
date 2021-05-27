sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

%est li sosed
next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses), nl,
		write(WHO1), write(" drinks water"), nl,
    		write(WHO2), write(" has zebra"), nl.

pr_ein2:- Hair=[_,_,_],  	
    	               
        in_list(Hair,[belokurov,_]),
    	in_list(Hair,[chernov,_]),
    	in_list(Hair,[rizhov,_]),
                
        in_list(Hair,[_,blond]),
    	in_list(Hair,[_,brunet]),
    	in_list(Hair,[_,red]),     
    	
    	not(in_list(Hair,[chernov,brunet])),
    	not(in_list(Hair,[rizhov,red])),
    	not(in_list(Hair,[belokurov,brunet])),
    	not(in_list(Hair,[belokurov,blond])),

        write(Hair).

%name, dress, shoes
pr_ein3:- Friends=[_,_,_],
    
    	in_list(Friends,[anya,_,_]),
    	in_list(Friends,[natasha,_,_]),
	in_list(Friends,[valya,_,_]),
    
    	in_list(Friends,[_,white,_]),
    	in_list(Friends,[_,green,_]),
    	in_list(Friends,[_,blue,_]),
    
    	in_list(Friends,[_,_,white]),
    	in_list(Friends,[_,_,green]),
    	in_list(Friends,[_,_,blue]),
	    
    	in_list(Friends,[natasha,_,green]),
    	
    	(in_list(Friends,[anya,green,green]);
		in_list(Friends,[anya,white,white]);
        in_list(Friends,[anya,blue,blue])),
    	       
    	not(in_list(Friends,[valya,white,_])),
		not(in_list(Friends,[valya,_,white])),
		not(in_list(Friends,[valya,white,white])),

	not(in_list(Friends,[valya,green,green])),
		not(in_list(Friends,[valya,white,white])),
        not(in_list(Friends,[valya,blue,blue])),
    	
    	not(in_list(Friends,[natasha,green,green])),
		not(in_list(Friends,[natasha,white,white])),
        not(in_list(Friends,[natasha,blue,blue])),
    	
    	write(Friends).

%name, post, age, relatives
pr_ein4:- Zavod = [_,_,_],
    	
    	in_list(Zavod,[_,slesar,younger,no]),
    	in_list(Zavod,[borisov,_,_,yes]),
    
    	in_list(Zavod,[ivanov,_,_,_]),
    	in_list(Zavod,[semenov,_,_,_]),
    
  		in_list(Zavod,[_,tokar,_,_]),
   		in_list(Zavod,[_,svarshik,_,_]),
    		
    	in_list(Zavod,[_,_,older,_]),
   		in_list(Zavod,[_,_,middle-aged,_]),
    
    	in_list(Zavod,[_,_,_,not-stated]),
    	   
    	not(in_list(Zavod,[_,tokar,older,_])),
    	not(in_list(Zavod,[semenov,tokar,_,_])),
    	not(in_list(Zavod,[semenov,_,younger,_])),
    	  	   	
    	write(Zavod).

%name, drink, position
pr_ein5:- Liquids = [_,_,_,_],
    	
    	in_list(Liquids,[bottle,_]),
    	in_list(Liquids,[glass,_]),
    	in_list(Liquids,[jug,_]),
    	in_list(Liquids,[can,_]),
    
    	in_list(Liquids,[_,milk]),
    	in_list(Liquids,[_,lemonade]),
    	in_list(Liquids,[_,kvas]),
    	in_list(Liquids,[_,water]),
    	    
		not(in_list(Liquids,[bottle,milk])),
    	not(in_list(Liquids,[bottle,water])),
    
    	not(in_list(Liquids,[jug,lemonade])),
    	not(in_list(Liquids,[jug,kvas])),
    	
    	not(in_list(Liquids,[can,lemonade])),
    	not(in_list(Liquids,[can,water])),
    
    	not(in_list(Liquids,[glass,milk])),
    	not(in_list(Liquids,[can,milk])),
    	
    	write(Liquids).

%name, profession
pr_ein6:- Talents = [_,_,_,_],
    	
    	
    	in_list(Talents,[pavlov,_]),
    	in_list(Talents,[levickiy,_]),
   		in_list(Talents,[voronov,_]),
    	in_list(Talents,[saharov,_]),
    
    	
    	in_list(Talents,[_,writer]),
    	in_list(Talents,[_,dancer]),
    	in_list(Talents,[_,artist]),
    	in_list(Talents,[_,singer]),
    
    	not(in_list(Talents,[voronov,singer])),
        not(in_list(Talents,[levickiy,singer])),
            
        not(in_list(Talents,[pavlov,writer])),
        not(in_list(Talents,[pavlov,artist])),
            
        not(in_list(Talents,[saharov,writer])),
        not(in_list(Talents,[voronov,writer])),
    
   		not(in_list(Talents,[voronov,artist])),
    	    	   	
    	write(Talents).

%name, nationality, sport
pr_ein7:- Competition = [_,_,_],
    	
    	in_list(Competition,[simon,israel,_]),	
    	in_list(Competition,[michael,_,basketball]),  	
    	
    	in_list(Competition,[richard,_,_]),
    	
    	in_list(Competition,[_,amerika,_]),
    	in_list(Competition,[_,australia,_]),
    
    	in_list(Competition,[_,_,tennis]),
    	in_list(Competition,[_,_,cricket]),
    	
    
    	not(in_list(Competition,[michael,amerika,_])),
    	not(in_list(Competition,[simon,_,tennis])),
        
    	in_list(Competition,[WHO1,australia,_]),
		in_list(Competition,[richard,_,WHO2]),
		write(Competition), nl,
		write(WHO1), write(" is from Australia"), nl,
    		write(WHO2), write(" is Richard's sport"), nl.


%name, truth/lie, 1/0 (flowers)
%vova & andrey tell truth
pr_ein8:- Students = [_,_,_,_],
       	    
    	in_list(Students,[petr,_,_]),
    	in_list(Students,[vova,_,_]),
		in_list(Students,[roma,_,_]),
		in_list(Students,[andrey,_,_]),
    	
    
    	in_list(Students,[_,truth,0]),
    	in_list(Students,[_,truth,0]),
    	in_list(Students,[_,lie,1]),
    	in_list(Students,[_,lie,0]),
           	    	
    	not(in_list(Students,[andrey,lie,_])),
    	not(in_list(Students,[roma,truth,_])),
    	not(in_list(Students,[petr,truth,_])),
    	not(in_list(Students,[vova,lie,_])),
    	not(in_list(Students,[roma,_,1])),
    
		write(Students).
