```mermaid
erDiagram
    SOCIO {
        int id_socio PK
        string curp_socio
        string nombre
        string direccion
        string telefono
    }
    BARCO {
        string num_matricula PK
        string nombre_barco
        int num_amarre
        decimal cuota_pago
        int id_socio FK
    }
    CAPITAN {
        int id_capitan PK
        string curp_capitan
        string nombre
        string direccion
        string telefono
    }
    SALIDA {
        int id_salida PK
        date fecha_salida
        time hora_salida
        string destino
        string num_matricula FK
        int id_capitan FK
    }

    SOCIO ||--o{ BARCO : "posee"
    BARCO ||--o{ SALIDA : "realiza"
    CAPITAN ||--o{ SALIDA : "dirige"
