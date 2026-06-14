```mermaid
erDiagram
    AUTOMOVIL {
        string num_bastidor PK
        string modelo
        decimal precio_base
        string matricula
        string tipo_disponibilidad
        int id_servicio_oficial FK
    }
    SERVICIO_OFICIAL {
        int id_servicio PK
        string nif
        string nombre
        string domicilio
    }
    VENDEDOR {
        int id_vendedor PK
        string curp_vendedor
        string nombre
        string domicilio
    }
    VENTA {
        int id_venta PK
        date fecha_entrega
        decimal precio_final
        string modo_pago
        string num_bastidor FK
        int id_vendedor FK
        int id_servicio FK
    }
    EXTRA_AUTOMOVIL {
        int id_extra PK
        string descripcion
        decimal precio_extra
        string num_bastidor FK
    }

    SERVICIO_OFICIAL ||--o{ AUTOMOVIL : "alberga"
    AUTOMOVIL ||--|| VENTA : "es_vendido"
    VENDEDOR ||--o{ VENTA : "realiza"
    SERVICIO_OFICIAL ||--o{ VENTA : "vende_en_tienda"
    AUTOMOVIL ||--o{ EXTRA_AUTOMOVIL : "contiene"
