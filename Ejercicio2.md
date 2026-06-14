```mermaid
erDiagram
    ABOGADO {
        int id_abogado PK
        string curp_abogado
        string nombre
        string especialidad
        string telefono
    }
    CLIENTE {
        int id_cliente PK
        string curp_cliente
        string nombre
        string telefono
        string direccion
    }
    ASUNTO {
        int id_asunto PK
        string num_expediente
        date fecha_inicio
        date fecha_cierre
        string estado_actual
        int id_cliente FK
    }
    ABOGADO_ASUNTO {
        int id_abogado FK
        int id_asunto FK
    }

    CLIENTE ||--o{ ASUNTO : "tiene"
    ABOGADO ||--o{ ABOGADO_ASUNTO : "es_asignado"
    ASUNTO ||--o{ ABOGADO_ASUNTO : "recibe"

    
