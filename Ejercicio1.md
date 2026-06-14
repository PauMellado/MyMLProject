```mermaid
graph TD
    %% Entidades (Rectángulos)
    S[SOCIO]
    B[BARCO]
    C[CAPITÁN]
    SA[SALIDA]

    %% Relaciones (Rombos)
    R1{posee}
    R2{realiza}
    R3{dirige}

    %% Atributos Socio (Óvalos)
    A1(((id_socio))) --- S
    A2((nombre)) --- S
    A3((telefono)) --- S

    %% Atributos Barco (Óvalos)
    B1(((num_matricula))) --- B
    B2((nombre_barco)) --- B
    B3((num_amarre)) --- B

    %% Atributos Capitán (Óvalos)
    C1(((id_capitan))) --- C
    C2((nombre)) --- C

    %% Atributos Salida (Óvalos)
    S1(((id_salida))) --- SA
    S2((fecha_salida)) --- SA
    S3((destino)) --- SA

    %% Conexiones con Cardinalidad
    S -- "1" --- R1
    R1 -- "N" ---> B
    B -- "1" --- R2
    R2 -- "N" ---> SA
    C -- "1" --- R3
    R3 -- "N" ---> SA
