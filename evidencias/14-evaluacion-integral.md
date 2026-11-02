# Actividad 14: Escenario integral

## Matriz de Evaluación de Riesgos

| Problema | Principio afectado | Riesgo | Control propuesto |
| :--- | :--- | :--- | :--- |
| **1. Analítica tiene acceso directo a la tabla `clientes` completa** | Mínimo privilegio / Confidencialidad | Acceso no autorizado a datos personales (PII) por personal que no lo requiere[cite: 12]. | Restringir permisos de lectura a la tabla base mediante RBAC (Control de Acceso Basado en Roles). |
| **2. Analítica puede ver PII (nombre, RFC, correo) cuando solo genera estadísticas** | Minimización de datos | Fuga de información sensible o robo interno de identidad[cite: 12]. | Crear vistas materializadas que solo expongan datos agregados (conteos, rangos). |
| **3. Conservación de datos por más de 12 años sin depurar** | Limitación del plazo de conservación | Aumento del impacto ante una brecha de seguridad al exponer datos de clientes obsoletos[cite: 12]. | Ejecutar procesos de purga o anonimización para cuentas inactivas antiguas. |
| **4. Inexistencia de una política de retención documentada** | Responsabilidad proactiva (Accountability) | Incumplimiento normativo y sanciones legales por auditorías fallidas[cite: 12]. | Redactar, aprobar y publicar una política formal del ciclo de vida del dato. |
| **5. Copias completas de la base de datos entregadas a desarrolladores** | Minimización y Mínimo privilegio | Proliferación descontrolada de bases de datos en equipos no monitoreados[cite: 12]. | Restringir el tamaño de las copias (ej. extraer solo una pequeña muestra estructural). |
| **6. Entornos de prueba/desarrollo contienen información real** | Seguridad y Confidencialidad | Exposición grave de datos reales, ya que los entornos de desarrollo suelen ser menos seguros[cite: 12]. | Implementar técnicas de enmascaramiento (*Data Masking*) u ofuscación antes de clonar. |
| **7. Marketing usa los correos indiscriminadamente para promociones** | Limitación de finalidad | Quejas por SPAM, revocaciones masivas y multas si no hubo consentimiento explícito[cite: 12]. | Filtrar envíos validando un campo `opt_in` (consentimiento) y usar vistas exclusivas para marketing. |
| **8. Falta de documentación sobre la finalidad de cada dato** | Transparencia / Licitud | Uso secundario indebido, ya que los empleados no saben qué está permitido hacer con cada campo[cite: 12]. | Elaborar un inventario y matriz de gobierno de datos. |
| **9. Concentración de todos los datos en una sola tabla de acceso general** | Privacidad por diseño | Vulnerabilidad de punto único de fallo; si un área es comprometida, se expone todo el perfil del cliente[cite: 12]. | Segmentar los datos en diferentes tablas por dominio (ej. `datos_fiscales`, `contacto`) o usar vistas departamentales estrictas. |
| **10. Ausencia general de separación de funciones (SoD)** | Seguridad de la información | Dificultad para auditar y rastrear quién modificó o extrajo qué información[cite: 12]. | Implementar un modelo de gobierno donde el DBA apruebe accesos justificados por área y activar logs de auditoría. |

