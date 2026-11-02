# Actividad 12: Privacidad por diseño

## Análisis del escenario
**Propuesta del desarrollador:** Guardar una gran cantidad de datos personales y sensibles (salario, estado civil, ocupación, etc.) bajo la premisa de "Es mejor guardar todos los datos por si posteriormente necesitamos alguno."[cite: 13]

### Respuestas a las preguntas

**1. ¿Qué problemas identificas?**[cite: 13]
Existe una recolección excesiva de datos personales y sensibles sin una finalidad definida. Almacenar datos "por si acaso" incrementa exponencialmente el riesgo ante una brecha de seguridad, aumenta los costos de almacenamiento y vulnera las normativas legales de protección de datos. Además, hay redundancia (recolectar `edad` y `fecha_nacimiento` al mismo tiempo).

**2. ¿Qué principio de privacidad se está ignorando?**[cite: 13]
Se está ignorando flagrantemente el **Principio de Minimización de Datos** y el **Principio de Limitación de Finalidad**, los cuales dictan que solo se deben recolectar los datos estrictamente necesarios para el propósito actual.

**3. ¿Qué preguntas realizarías antes de aprobar el diseño?**[cite: 13]
*   ¿Cuál es el proceso de negocio exacto que justifica la recolección de cada uno de estos campos?
*   ¿Existe una obligación legal para solicitar datos financieros como el salario o el estado civil?
*   ¿El sistema principal puede funcionar operativamente solo con el nombre y correo del cliente?
*   ¿Cómo se protegerán estos datos y quién tendrá acceso a ellos?

**4. ¿Qué datos eliminarías?**[cite: 13]
Eliminaría de inmediato los campos que no tienen relación con un registro básico de cliente: `salario`, `estado_civil`, `ocupacion` y `edad` (se puede calcular a partir de la fecha de nacimiento si fuera estrictamente necesaria, o guardar solo un rango).

**5. ¿Qué datos requerirían una justificación adicional?**[cite: 13]
*   `rfc`: Solo se justifica si el sistema emite facturas (CFDI).
*   `direccion`, `codigo_postal` y `ciudad`: Solo se justifican si el servicio incluye envíos físicos, logística o visitas a domicilio.
*   `fecha_nacimiento`: Solo se justifica si existe una restricción legal de edad para usar el servicio.

**6. ¿Cómo aplicarías privacidad por defecto?**[cite: 13]
Diseñando la tabla de registro inicial con los campos mínimos indispensables (ej. `id`, `nombre`, `correo` y contraseña). Cualquier dato adicional (como RFC o dirección de envío) debe solicitarse en el sistema **únicamente** en el momento exacto en que el usuario decida utilizar ese módulo específico (ej. al procesar un pago o pedir una factura), y no durante el registro inicial.
