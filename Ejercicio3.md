```mermaid
graph TD
    %% Entidades (Rectángulos)
    AU[AUTOMÓVIL]
    SO[SERVICIO OFICIAL]
    VE[VENDEDOR]
    VTA[VENTA]
    EX[EXTRA AUTOMÓVIL]

    %% Relaciones (Rombos)
    R1{alberga}
    R2{contiene}
    R3{vende_en_tienda}
    R4{realiza}
    R5{es_vendido}

    %% Atributos Servicio Oficial
    SO1(((id_servicio))) --- SO
    SO2((nif)) --- SO
    SO3((nombre)) --- SO
    SO4((domicilio)) --- SO

    %% Atributos Automóvil (Campos Completos)
    AU1(((num_bastidor))) --- AU
    AU2((marca)) --- AU
    AU3((modelo)) --- AU
    AU4((precio_base)) --- AU
    AU5((descuento)) --- AU
    AU6((potencia_fiscal)) --- AU
    AU7((cilindrada)) --- AU
    AU8((matricula)) --- AU
    AU9((tipo_disponibilidad)) --- AU

    %% Atributos Extra
    E1(((id_extra))) --- EX
    E2((descripcion)) --- EX
    E3((precio_extra)) --- EX

    %% Atributos Vendedor
    V1(((id_vendedor))) --- VE
    V2((curp_vendedor)) --- VE
    V3((nombre)) --- VE
    V4((domicilio)) --- VE

    %% Atributos Venta
    VT1(((id_venta))) --- VTA
    VT2((fecha_entrega)) --- VTA
    VT3((precio_final)) --- VTA
    VT4((modo_pago)) --- VTA

    %% Conexiones de la Arquitectura de Negocio
    SO -- "1" --- R1
    R1 -- "N" ---> AU
    AU -- "1" --- R2
    R2 -- "N" ---> EX
    AU -- "1" --- R5
    R5 -- "1" ---> VTA
    VE -- "1" --- R4
    R4 -- "N" ---> VTA
    SO -- "1" --- R3
    R3 -- "N" ---> VTA
