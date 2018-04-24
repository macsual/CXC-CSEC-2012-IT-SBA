PROGRAM Insurance_GTA;

USES crt;

{Author: Romario A. Maxwell
School: Campion College
Territory: Jamaica
Centre No.: 100016
Date:March 20, 2012
Program description: The program will prompt, accept and store insurance company
customers' details, generate statistics from input data and calculate insurance
paymets. This program will also facilitate the search, retrieval and display of
a customer's details.
}

CONST
      geicoprem = 1650.00;
      nationwideprem = 3500.00;
      statefarmprem = 2000.00;
      progressiveprem = 2200.00;

VAR
      f_name:ARRAY[1..30] of STRING;
      l_name:ARRAY[1..30] of STRING;
      sex:ARRAY[1..30] of STRING;
      car_type:ARRAY[1..30] of STRING;
      car_cat:ARRAY[1..30] of STRING;
      car_mod:ARRAY[1..30] of STRING;
      insurance_co:ARRAY[1..30] of STRING;
      toc:Array[1..30] of STRING;
      antitheft:ARRAY[1..30] of STRING;
      car_val:ARRAY[1..30] of REAL;
      premium:ARRAY[1..30] of REAL;
      car_age:ARRAY[1..30] of INTEGER;
      insurance_pay:ARRAY[1..30] of REAL;
      x, m, s, no_cars_fc, optdatsearch, clearcorr, v, u, search_con, error1, error2, error3, error4, error5, error6, research, no_cars_antitheft:INTEGER;
      tot_prem, percent_antitheft, hval:REAL;
      field1, str1, str2, str3, str4, str5, str6, field2:STRING;
      found1, found2, found3, found4:BOOLEAN;

PROCEDURE Input_Dat;
          BEGIN
               tot_prem := 0;
               premium[x] := 0;
               car_age[x] := 0;
               car_val[x] := 0;
               insurance_pay[x] := 0;
               hval := 0;
               no_cars_antitheft := 0;
               no_cars_fc := 0;
               x := 0;
               error1 := 0;
               error2 := 0;
               error6 := 0;
               clearcorr:= 0;
               str1 := '0';
               str2 := '0';
               str6 := '0';
               WRITELN('----------------------------------------------------------------------------');
               WRITELN('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<RECORD ENTRY>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
               WRITELN('----------------------------------------------------------------------------');
               WRITELN;
               FOR x:= 1 TO 30 DO
                   BEGIN
                        WRITELN('ENTER EVERYTHING IN CAPITAL LETTERS');
                        WRITELN;
                        WRITELN('<<<<<<<<<<<RECORD ',x,' OF ',x,'>>>>>>>>>>>>>');
                        WRITELN;
                        WRITELN('Enter first name.');
                        READLN(f_name[x]);
                        WRITELN;
                        WRITELN('Enter surname.');
                        READLN(l_name[x]);
                        WRITELN;
                        WRITELN('Enter gender. "M" for male and "F" for female.');
                        READLN(sex[x]);
                        WHILE ((sex[x] <> 'M') AND (sex[x] <> 'F')) DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid response.');
                                   WRITELN;
                                   WRITELN('Re-enter the data correctly.');
                                   READLN(sex[x]);
                              END;
                        WRITELN;
                        WRITELN('Enter the name of the insurance company for the vehicle.');
                        READLN(insurance_co[x]);
                        WHILE ((insurance_co[x] <> 'GEICO') AND (insurance_co[x] <> 'STATEFARM') AND (insurance_co[x] <> 'PROGRESSIVE') AND (insurance_co[x] <> 'NATIONWIDE')) DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid response.');
                                   WRITELN;
                                   WRITELN('Re-enter the data correctly.');
                                   READLN(insurance_co[x]);
                              END;
                        IF insurance_co[x] = 'GEICO' THEN
                           BEGIN
                                premium[x] := geicoprem;
                           END
                        ELSE
                            IF insurance_co[x] = 'STATEFARM' THEN
                               BEGIN
                                    premium[x] := statefarmprem;
                               END
                            ELSE
                                IF insurance_co[x] = 'PROGRESSIVE' THEN
                                   BEGIN
                                        premium[x] := progressiveprem;
                                   END
                                ELSE
                                    BEGIN
                                         premium[x] := nationwideprem;
                                    END;
                        WRITELN;
                        WRITELN('The insurance premium is $',premium[x]:4:2,'.');
                        tot_prem := tot_prem + premium[x];
                        WRITELN;
                        WRITELN('Input "FC" for comprehensive coverage and "TPO" for third party coverage.');
                        READLN(toc[x]);
                        WHILE ((toc[x] <> 'FC') AND (toc[x] <> 'TPO')) DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid response.');
                                   WRITELN;
                                   WRITELN('Re-enter the data correctly.');
                                   READLN(toc[x]);
                        END;
                        IF toc[x] = 'FC' THEN
                           no_cars_fc := no_cars_fc + 1;
                        WRITELN;
                        WRITELN('State whether vehicle is: "CAR", "SUV", "VAN", "TRUCK", "BUS" or "O" for other.');
                        READLN(car_type[x]);
                        WHILE ((car_type[x] <> 'CAR') AND (car_type[x] <> 'SUV') AND (car_type[x] <> 'VAN') AND (car_type[x] <> 'TRUCK') AND (car_type[x] <> 'BUS') AND (car_type[x] <> 'O')) DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid response.');
                                   WRITELN;
                                   WRITELN('Re-enter the data correctly.');
                                   READLN(car_type[x]);
                        END;
                        WRITELN;
                        IF car_type[x] = 'CAR' THEN
                           BEGIN
                                WRITELN('Enter "LCR-70".');
                                READLN(car_cat[x]);
                                WHILE (car_cat[x] <> 'LCR-70') DO
                                      BEGIN
                                           WRITELN;
                                           WRITELN('Invalid response.');
                                           WRITELN;
                                           WRITELN('Re-enter the data correctly.');
                                           READLN(car_cat[x]);
                                      END;
                           END
                        ELSE
                            IF ((car_type[x] = 'SUV') or (car_type[x] = 'VAN')) THEN
                               BEGIN
                                    WRITELN('Enter "LCR-71".');
                                    READLN(car_cat[x]);
                                    WHILE (car_cat[x] <> 'LCR-71') DO
                                          BEGIN
                                               WRITELN;
                                               WRITELN('Invalid response.');
                                               WRITELN;
                                               WRITELN('Re-enter the data correctly.');
                                               READLN(car_cat[x]);
                                          END;
                               END
                            ELSE
                                IF ((car_type[x] = 'TRUCK') or (car_type[x] = 'BUS')) THEN
                                   BEGIN
                                        WRITELN('Enter "LCR-72".');
                                        READLN(car_cat[x]);
                                        WHILE (car_cat[x] <> 'LCR-72') DO
                                              BEGIN
                                                   WRITELN;
                                                   WRITELN('Invalid response.');
                                                   WRITELN;
                                                   WRITELN('Re-enter the data correctly.');
                                                   READLN(car_cat[x]);
                                              END;
                                   END
                                ELSE
                                    BEGIN
                                         WRITELN('Enter "LCR-73".');
                                         READLN(car_cat[x]);
                                         WHILE (car_cat[x] <> 'LCR-73') DO
                                               BEGIN
                                                    WRITELN;
                                                    WRITELN('Invalid response.');
                                                    WRITELN;
                                                    WRITELN('Re-enter the data correctly.');
                                                    READLN(car_cat[x]);
                                               END;
                                    END;
                        WRITELN;
                        WRITELN('The vehicle category is ',car_cat[x],'.');
                        WRITELN;
                        WRITELN('Does the vehicle have an anti-theft device installed? State "YES" or "NO".');
                        READLN(antitheft[x]);
                        WHILE ((antitheft[x] <> 'YES') AND (antitheft[x] <> 'NO')) DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid response.');
                                   WRITELN;
                                   WRITELN('Re-enter the data correctly.');
                                   READLN(antitheft[x]);
                        END;
                        IF antitheft[x] = 'YES' THEN
                           no_cars_antitheft := no_cars_antitheft+1;
                        WRITELN;
                        WRITELN('Enter the vehicle model.');
                        READLN(car_mod[x]);
                        WRITELN;
                        WRITELN('Enter the age of the vehicle.');
                        READLN(str1);
                        VAL(str1, car_age[x], error1);
                        WHILE error1 <> 0 DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid data type entered.');
                                   WRITELN;
                                   WRITELN('Re-enter data of the correct data type.');
                                   READLN(str1);
                                   VAL(str1, car_age[x], error1);
                              END;
                        WRITELN;
                        WRITELN('Enter the value of the vehicle.');
                        READLN(str2);
                        VAL(str2, car_val[x], error2);
                        WHILE error2 <> 0 DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid data type entered.');
                                   WRITELN;
                                   WRITELN('Re-enter data of the correct data type.');
                                   READLN(str2);
                                   VAL(str2, car_val[x], error2);
                              END;
                        IF hval < car_val[x] THEN
                           hval := car_val[x];
                        IF ((toc[x] = 'FC') AND (car_age[x] <= 1)) THEN
                           BEGIN
                                insurance_pay[x] := 0.5*car_val[x];
                           END
                        ELSE
                            IF ((toc[x] = 'FC') AND (car_age [x] <= 4)) THEN
                               BEGIN
                                    insurance_pay[x] := 0.4*car_val[x];
                               END
                            ELSE
                                IF ((toc[x] = 'FC') AND (car_age[x] <= 7)) THEN
                                   BEGIN
                                        insurance_pay[x] := 0.3*car_val[x];
                                   END
                                ELSE
                                    IF ((toc[x] = 'FC') AND (car_age[x] <= 10)) THEN
                                       BEGIN
                                            insurance_pay[x] := 0.2*car_val[x];
                                       END
                                    ELSE
                                        IF ((toc[x] = 'FC') AND (car_age[x] > 10)) THEN
                                           BEGIN
                                             insurance_pay[x] := 0.1*car_val[x];
                                           END
                                        ELSE
                                            BEGIN
                                                 insurance_pay[x] := 0.00;
                                            END;
                        WRITELN;
                        WRITELN('The insurance payment on the vehicle is $',insurance_pay[x]:9:2,'.');
                        WRITELN('----------------------------------------------------------------------------');
                        READLN;
                        WRITELN('Hit "1" to clear record to make corrections or "2" to proceed.');
                        READLN(str6);
                        VAL(str6, clearcorr, error6);
                        WHILE error6 <> 0 DO
                              BEGIN
                                   WRITELN;
                                   WRITELN('Invalid data type entered.');
                                   WRITELN;
                                   WRITELN('Re-enter data of the correct data type.');
                                   READLN(str6);
                                   VAL(str6, clearcorr, error6);
                              END;
                        IF clearcorr = 1 THEN
                           BEGIN
                                no_cars_antitheft := no_cars_antitheft - 1;
                                no_cars_fc := no_cars_fc - 1;
                                tot_prem := tot_prem - premium[x];
                                x := x-1;
                           END
                        ELSE
                            BEGIN
                            END;
                            WRITELN;
                   END;
          END;
{This procedure allows insurance customer information to be input and stored
}

Procedure Stats;
          BEGIN
               percent_antitheft := 0;
               WRITELN('----------------------------------------------------------------------------');
               WRITELN('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<STATISTICS>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
               WRITELN('----------------------------------------------------------------------------');
               WRITELN;
               WRITELN('The total number of customer records stored in the database is ',x,'.');
               WRITELN;
               WRITELN('The number of comprehensively insured vehicles is ',no_cars_fc,'.');
               WRITELN;
               WRITELN('The number of cars with anti-theft devices installed is ',no_cars_antitheft,'.');
               WRITELN;
               percent_antitheft:=(no_cars_antitheft/x)*100;
               WRITELN('The percentage of vehicles with anti-theft devices installed is ',percent_antitheft:3:2,'%.');
               WRITELN;
               WRITELN('The highest vehicle value in the database is $',hval:9:2,'.');
               WRITELN;
               WRITELN('The total premium of all customers is $',tot_prem:9:2,'.');
               WRITELN('----------------------------------------------------------------------------');
               READLN;
          END;

{This procedure generates statistical information from the stored records
}

Procedure SearchAndRetrieve;
          BEGIN
               error4 := 0;
               error3 := 0;
               v := 30;
               u := 30;
               s := 1;
               m := 1;
               research := 0;
               search_con := 0;
               str4 := '0';
               str3 := '0';
               found1 := false;
               found2 := false;
               found3 := false;
               found4 := false;
               WRITELN('----------------------------------------------------------------------------');
               WRITELN('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<RECORD SEARCH>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
               WRITELN('----------------------------------------------------------------------------');
               WRITELN;
               WRITELN('Enter "1" to begin search, "2" to review statistics or "3" to quit.');
               READLN(str3);
               VAL(str3, search_con, error3);
               WHILE error3 <> 0 DO
                     BEGIN
                          WRITELN;
                          WRITELN('Invalid data type entered.');
                          WRITELN;
                          WRITELN('Re-enter data of the correct data type.');
                          READLN(str3);
                          VAL(str3, search_con, error3);
               END;
               IF search_con = 2 THEN
                  BEGIN
                       Stats;
                       SearchAndRetrieve;
                  END
               ELSE
                   IF search_con = 3 THEN
                      BEGIN
                           halt;
                      END;
               WRITELN;
               WRITELN('Enter the first name of the customer.');
               READLN(field1);
               WRITELN;
               WHILE (found1 = false) AND (m <= 30) DO
                     BEGIN
                          IF (f_name[m] = field1) THEN
                             BEGIN
                                  found1 := true;
                             END
                          ELSE
                             m := m+1;
                             END;
               WRITELN('Enter the last name of the customer.');
               READLN(field2);
               WRITELN;
               WHILE (found2 = false) AND (s <= 30) DO
                     BEGIN
                          IF (l_name[s] = field2) THEN
                             BEGIN
                                  found2 := true;
                             END
                          ELSE
                              s := s+1;
                              END;
               WHILE (found3 = false) AND (u <= 30) DO
                     BEGIN
                          IF (f_name[u] = field1) THEN
                             BEGIN
                                  found3 := true;
                             END
                          ELSE
                             u := u-1;
                             END;
               WHILE (found4 = false) AND (v <= 30) DO
                     BEGIN
                          IF (l_name[v] = field2) THEN
                             BEGIN
                                  found4 := true;
                             END
                          ELSE
                              v := v-1;
                              END;
               IF ((m = s) AND (u = v) AND (found1 = true) AND (found2 = true) AND (found3 = true) AND (found4 = true) AND (m <> u) AND (s <> v)) THEN
                  BEGIN
                       WRITELN('There are at least two individuals with the name ',f_name[m],' ',l_name[m],' in the database.');
                       WRITELN;
                       WRITELN('#FORWARD SEARCH RESULT#');
                       WRITELN;
                       WRITELN('<<<<<<<<<<<<<<<<<<<RECORD NO. ',m,' OF ',x,'>>>>>>>>>>>>>>>>>>>>>>>>');
                       WRITELN;
                       WRITELN('FIRST NAME: ',f_name[m]);
                       WRITELN;
                       WRITELN('LAST NAME: ',l_name[m]);
                       WRITELN;
                       WRITELN('SEX: ',sex[m]);
                       WRITELN;
                       WRITELN('INSURANCE CO.: ',insurance_co[m]);
                       WRITELN;
                       WRITELN('TYPE OF COVERAGE: ',toc[m]);
                       WRITELN;
                       WRITELN('PREMIUM: $',premium[m]:4:2);
                       WRITELN;
                       WRITELN('VEHICLE CATEGORY: ',car_cat[m]);
                       WRITELN;
                       WRITELN('VEHICLE MODEL: ',car_mod[m]);
                       WRITELN;
                       WRITELN('VEHICLE AGE: ',car_age[m]);
                       WRITELN;
                       WRITELN('VEHICLE VALUE: $',car_val[m]:9:2);
                       WRITELN;
                       WRITELN('ANTITHEFT INSTALLED: ',antitheft[m]);
                       WRITELN;
                       WRITELN('INSURANCE PAYMENT: $',insurance_pay[m]:9:2);
                       WRITELN('----------------------------------------------------------------------------');
                       READLN;
                       WRITELN;
                       WRITELN('#REVERSE SEARCH RESULT#');
                       WRITELN;
                       WRITELN('<<<<<<<<<<<<<<<<<<<RECORD NO. ',u,' OF ',x,'>>>>>>>>>>>>>>>>>>>>>>>>');
                       WRITELN;
                       WRITELN('FIRST NAME: ',f_name[u]);
                       WRITELN;
                       WRITELN('LAST NAME: ',l_name[u]);
                       WRITELN;
                       WRITELN('SEX: ',sex[u]);
                       WRITELN;
                       WRITELN('INSURANCE CO.: ',insurance_co[u]);
                       WRITELN;
                       WRITELN('TYPE OF COVERAGE: ',toc[u]);
                       WRITELN;
                       WRITELN('PREMIUM: $',premium[u]:4:2);
                       WRITELN;
                       WRITELN('VEHICLE CATEGORY: ',car_cat[u]);
                       WRITELN;
                       WRITELN('VEHICLE MODEL: ',car_mod[u]);
                       WRITELN;
                       WRITELN('VEHICLE AGE: ',car_age[u]);
                       WRITELN;
                       WRITELN('VEHICLE VALUE: $',car_val[u]:9:2);
                       WRITELN;
                       WRITELN('ANTITHEFT INSTALLED: ',antitheft[u]);
                       WRITELN;
                       WRITELN('INSURANCE PAYMENT: $',insurance_pay[u]:9:2);
                       WRITELN('----------------------------------------------------------------------------');
                       READLN;
                  END
               ELSE
                   IF ((m = s) AND (found1 = true) AND (found2 = true)) THEN
                      BEGIN
                           WRITELN('<<<<<<<<<<<<<<<<<<<RECORD NO. ',m,' OF ',x,'>>>>>>>>>>>>>>>>>>>>>>>>');
                           WRITELN;
                           WRITELN('FIRST NAME: ',f_name[m]);
                           WRITELN;
                           WRITELN('LAST NAME: ',l_name[m]);
                           WRITELN;
                           WRITELN('SEX: ',sex[m]);
                           WRITELN;
                           WRITELN('INSURANCE CO.: ',insurance_co[m]);
                           WRITELN;
                           WRITELN('TYPE OF COVERAGE: ',toc[m]);
                           WRITELN;
                           WRITELN('PREMIUM: $',premium[m]:4:2);
                           WRITELN;
                           WRITELN('VEHICLE CATEGORY: ',car_cat[m]);
                           WRITELN;
                           WRITELN('VEHICLE MODEL: ',car_mod[m]);
                           WRITELN;
                           WRITELN('VEHICLE AGE: ',car_age[m]);
                           WRITELN;
                           WRITELN('VEHICLE VALUE: $',car_val[m]:9:2);
                           WRITELN;
                           WRITELN('ANTITHEFT INSTALLED: ',antitheft[m]);
                           WRITELN;
                           WRITELN('INSURANCE PAYMENT: $',insurance_pay[m]:9:2);
                           WRITELN('----------------------------------------------------------------------------');
                           READLN;
                      END
                   ELSE
                       BEGIN
                            WRITELN('<<<NO RECORD FOUND>>>');
                            READLN;
                       END;
               WRITELN('Enter "1" to do another search, "2" to review the statistics or "3" to quit.');
               READLN(str4);
               VAL(str4, research, error4);
               WHILE error4 <> 0 DO
                     BEGIN
                          WRITELN;
                          WRITELN('Invalid data type entered.');
                          WRITELN;
                          WRITELN('Re-enter data of the correct data type.');
                          READLN(str4);
                          VAL(str4, research, error4);
                     END;
               IF research = 1 THEN
                  BEGIN
                       SearchAndRetrieve;
                  END
               ELSE
                   IF research = 2 THEN
                      BEGIN
                           Stats;
                           SearchAndRetrieve;
                      END
                   ELSE
                       BEGIN
                            halt;
                       END;
          END;

{This procedure allows a specific customer's record to be searched for, retrieved and returned
}

PROCEDURE Splash;
          BEGIN
               WRITELN('----------------------------------------------------------------------------');
               WRITELN('<<<<<<<<<<<<<<<<<<<<<<<<<INSURANCE COMPANY TOOL>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
               WRITELN('----------------------------------------------------------------------------');
          END;

BEGIN
     str5 := '0';
     error5 := 0;
     optdatsearch := 0;
     Splash;
     Input_Dat;
     Stats;
     WRITELN('Enter "1" to search the database or "2" to quit.');
     READLN(str5);
     VAL(str5, optdatsearch, error5);
     WHILE error5 <> 0 DO
           BEGIN
                WRITELN;
                WRITELN('Invalid data type entered.');
                WRITELN;
                WRITELN('Re-enter data of the correct data type.');
                READLN(str5);
                VAL(str5, optdatsearch, error5);
           END;
     IF optdatsearch = 1 THEN
        BEGIN
             SearchAndRetrieve;
        END
     ELSE
         BEGIN
              halt;
         END;
END.
