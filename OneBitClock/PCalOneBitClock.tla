-------------------------- MODULE PCalOneBitClock --------------------------

EXTENDS Integers

(***************************************************************************

--algorithm Clock {

   variable b \in {0, 1};
   { while(true) {
   
      if(b = 0) b := 1 else b:= 0
   }
   }

}

 ***************************************************************************)
\* BEGIN TRANSLATION
VARIABLES b, pc

vars == << b, pc >>

Init == (* Global variables *)
        /\ b \in {0, 1}
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF TRUE
               THEN /\ IF b = 0
                          THEN /\ b' = 1
                          ELSE /\ b' = 0
                    /\ pc' = "Lbl_1"
               ELSE /\ pc' = "Done"
                    /\ b' = b

Next == Lbl_1
           \/ (* Disjunct to prevent deadlock on termination *)
              (pc = "Done" /\ UNCHANGED vars)

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION

=============================================================================
\* Modification History
\* Last modified Wed Nov 16 22:20:58 GMT+05:30 2016 by vijay.daniel
\* Created Tue Nov 15 23:11:08 GMT+05:30 2016 by vijay.daniel
