erDiagram
    REGIONES ||--o{ CLIENTES : tiene
    AGENTES ||--o{ FACTURAS : emite
    CLIENTES ||--o{ FACTURAS : realiza
    FACTURAS ||--|{ DETALLE_FACTURA : contiene
    PRODUCTOS ||--|{ DETALLE_FACTURA : pertenece

    REGIONES {
        int ID_REGION PK
        int NUMERO_REGION
        string NOMBRE_REGION
    }

    AGENTES {
        int ID_AGENTE PK
        string NOMBRE_AGENTE
    }

    CLIENTES {
        int ID_CLIENTE PK
        string NOMBRE_CLIENTE
        int ID_REGION FK
    }

    PRODUCTOS {
        int ID_PRODUCTO PK
        string NOMBRE_PRODUCTO
        decimal TASAIVA
    }

    FACTURAS {
        int ID_FACTURA PK
        date FECHA_FACTURA
        decimal IMPORTE_TOTAL
        int ID_CLIENTE FK
        int ID_AGENTE FK
    }

    DETALLE_FACTURA {
        int ID_DETALLE PK
        int ID_FACTURA FK
        int ID_PRODUCTO FK
        decimal CANTIDAD
    }
