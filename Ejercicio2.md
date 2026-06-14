```mermaid
graph TD
    %% Entidades (Rectángulos)
    CL[CLIENTE]
    AS[ASUNTO]
    AB[ABOGADO]

    %% Relaciones (Rombos)
    R1{tiene}
    R2{llevan}

    %% Atributos Cliente (Círculos)
    C1(((id_cliente))) --- CL
    C2((curp_cliente)) --- CL
    C3((nombre)) --- CL
    C4((telefono)) --- CL
    C5((direccion)) --- CL

    %% Atributos Asunto (Círculos)
    A1(((id_asunto))) --- AS
    A2((num_expediente)) --- AS
    A3((fecha_inicio)) --- AS
    A4((fecha_cierre)) --- AS
    A5((estado_actual)) --- AS

    %% Atributos Abogado (Círculos)
    B1(((id_abogado))) --- AB
    B2((curp_abogado)) --- AB
    B3((nombre)) --- AB
    B4((especialidad)) --- AB
    B5((telefono)) --- AB

    %% Conexiones con Cardinalidad
    CL -- "1" --- R1
    R1 -- "N" ---> AS
    AB -- "N" --- R2
    R2 -- "M" ---> AS
