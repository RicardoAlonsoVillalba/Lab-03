# Actividad 11: Matriz de gobierno de datos

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **nombre** | Identificación del cliente y servicio | Dirección | Atención al cliente, Facturación, DBA | Cifrado en reposo | Fin de relación comercial + 5 años | Eliminación segura |
| **correo** | Comunicación y envío de comprobantes | Atención al cliente | Atención al cliente, Facturación | Cifrado en reposo | Fin de relación comercial + 5 años | Eliminación segura |
| **telefono** | Soporte técnico y contacto rápido | Atención al cliente | Atención al cliente | Cifrado en reposo | Fin de relación comercial | Eliminación segura |
| **rfc** | Cumplimiento fiscal y facturación | Facturación | Facturación, DBA | Cifrado estricto y acceso restringido | 5 años (por obligación fiscal) | Destrucción segura y borrado de logs |
| **edad** | Análisis demográfico y estadístico | Analítica | Analítica, Dirección | Agregación y vistas materializadas | Indefinido (solo si está anonimizado) | Anonimización irreversible |
| **ciudad** | Logística y estadísticas de cobertura | Dirección | Atención al cliente, Analítica | Vistas filtradas (para analítica) | Fin de relación comercial | Anonimización o eliminación |
| **codigo_postal**| Envíos y análisis territorial | Dirección | Atención al cliente, Analítica | Vistas filtradas (para analítica) | Fin de relación comercial | Anonimización o eliminación |

