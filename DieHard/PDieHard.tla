------------------------------ MODULE PDieHard ------------------------------

EXTENDS Integers

(******

--algorithm DieHard {
   
   variables big = 0, small = 0; {
      
      while(TRUE) {
      
         either big := 5
         or     small := 3
         or     big := 0
         or     small := 0
         or     with(poured = Min(big, 3 - small)) {
                  small := small + poured;
                  big := big - poured;
                  
                }
          or   with(poured = Min(small, 5 - big)) {
                  big := big + poured;
                  small := small - poured;
               }
      }
   }
}

******)

Min(m, n) == IF m < n THEN m ELSE n


\* BEGIN TRANSLATION
VARIABLES big, small

vars == << big, small >>

Init == (* Global variables *)
        /\ big = 0
        /\ small = 0

Next == \/ /\ big' = 5
           /\ small' = small
        \/ /\ small' = 3
           /\ big' = big
        \/ /\ big' = 0
           /\ small' = small
        \/ /\ small' = 0
           /\ big' = big
        \/ /\ LET poured == Min(big, 3 - small) IN
                /\ small' = small + poured
                /\ big' = big - poured
        \/ /\ LET poured == Min(small, 5 - big) IN
                /\ big' = big + poured
                /\ small' = small - poured

Spec == Init /\ [][Next]_vars

\* END TRANSLATION


=============================================================================
\* Modification History
\* Last modified Thu Nov 17 17:38:09 GMT+05:30 2016 by vijay.daniel
\* Created Thu Nov 17 17:16:51 GMT+05:30 2016 by vijay.daniel
