# Actividades 6, 7 y 8: Derechos ARCO y Ciclo de vida de los datos

## Actividad 6: Derecho de acceso

### Análisis de la solicitud
**¿Qué información adicional debería proporcionar la organización además del resultado de esta consulta? (Identificando las implicaciones técnicas)**

Técnicamente, ejecutar un simple `SELECT` sobre la tabla transaccional principal (`clientes`) no refleja toda la huella de los datos del titular[cite: 10]. Además de este resultado, a nivel de base de datos y sistemas, se debe considerar proporcionar información sobre:

1. **Sistemas derivados y de analítica:** Indicar si su información ha sido procesada, extraída o copiada hacia bodegas de datos (Data Warehouses), cachés, o tablas derivadas que alimenten otras áreas.
2. **Copias de seguridad (Backups) y retención:** Aclarar que su información también reside en los respaldos históricos de la base de datos y logs de transacciones, indicando los plazos técnicos en que estos respaldos se sobreescriben o destruyen.
3. **Logs de auditoría:** Información técnica sobre quién y cuándo ha accedido o modificado sus datos personales dentro del sistema (trazabilidad).
4. **Sistemas interconectados:** Si la base de datos principal está conectada o sincronizada con sistemas de terceros (por ejemplo, CRMs o plataformas de envíos de correos), ya que el dato también vive replicado allí.

---

## Actividad 7: Derecho de rectificación

### Código SQL de la operación
De acuerdo con la solicitud del titular para corregir su correo, se ejecutaron las siguientes instrucciones:
```sql
UPDATE clientes SET correo = 'nuevo-correo@example.com' WHERE id = 1;
SELECT id, nombre, correo FROM clientes WHERE id = 1;
cat << 'EOF' >> evidencias/08-ciclo-vida.md

### Preguntas y Respuestas (Actividad 7)

**1. ¿Cómo podría comprobarse que el cambio fue autorizado?**
A nivel técnico, mediante tablas de auditoría (logs) que vinculen la transacción de actualización con un ID de solicitud. A nivel administrativo, conservando la solicitud formal de rectificación validada con la identidad del titular.

**2. ¿Debería registrarse quién realizó el cambio?**
Sí, es estrictamente necesario. Se debe registrar qué usuario ejecutó el comando de actualización, así como la fecha y hora exactas de la modificación.

**3. ¿Por qué la trazabilidad será importante?**
Para cumplir con auditorías normativas, detectar modificaciones maliciosas o errores humanos, resolver disputas con el titular y demostrar responsabilidad proactiva en el manejo de los datos.

---

## Actividad 8: Derecho de cancelación y ciclo de vida

### Análisis previo al borrado
Ante una solicitud de cancelación autorizada, antes de ejecutar un `DELETE`, se deben considerar los siguientes elementos técnicos:
* **¿Existen otras tablas relacionadas?** Sí, normalmente hay tablas con llaves foráneas (ej. compras, tickets de soporte).
* **¿Existen respaldos?** Sí, copias de seguridad completas o incrementales (dumps/snapshots).
* **¿Existen réplicas?** Sí, bases de datos de solo lectura para balanceo de carga.
* **¿Existen registros de auditoría?** Sí, logs de transacciones de la base de datos o aplicaciones.
* **¿Existen copias utilizadas para analítica?** Sí, bodegas de datos (Data Warehouses) o vistas materializadas.
* **¿Existen archivos exportados?** Sí, reportes en CSV o Excel descargados por empleados.
* **¿Existen sistemas externos?** Sí, plataformas de marketing, CRMs o pasarelas de pago sincronizadas.

### Mapa de dispersión de la información
```text
clientes
|
|---- respaldos
|---- réplicas
|---- reportes
|---- exportaciones
|____ sistemas externos
cat << 'EOF' >> evidencias/08-ciclo-vida.md

### Pregunta
**¿Por qué eliminar un registro de una tabla no necesariamente significa que toda la información relacionada con esa persona haya desaparecido de la organización?**
Porque el ciclo de vida de los datos va más allá de la base de datos principal. Al ejecutar un comando DELETE, el registro desaparece del sistema en vivo, pero la información de esa persona aún puede existir en copias de seguridad (respaldos), bases de datos replicadas, reportes exportados localmente por los empleados, bodegas de analítica o en sistemas externos vinculados. Garantizar la eliminación requiere rastrear y borrar el dato en todo este ecosistema.

---

## Actividad 9: Derecho de oposición

### Análisis
**¿Es necesario eliminar inmediatamente todos sus datos de la base?**[cite: 10]
No. El derecho de oposición consiste en que el titular solicita que sus datos no sean tratados para fines específicos (por ejemplo, finalidades secundarias como marketing), lo cual no significa cancelar o eliminar su registro completo si aún existe una relación jurídica o de servicio vigente.

### Explicación detallada
**1. Qué información podría necesitar mantenerse:**[cite: 10]
Se deben conservar todos los datos estrictamente necesarios para cumplir con la finalidad principal (prestación del servicio, facturación o soporte técnico). Por ejemplo: el `id`, `nombre`, `correo` (solo para notificaciones del servicio) y `rfc` (por obligaciones fiscales).

**2. Qué información podría dejar de utilizarse para determinada finalidad:**[cite: 10]
Cualquier dato utilizado para el fin secundario al que se opuso. Por ejemplo, su correo dejará de usarse para enviar promociones, y su `edad`, `ciudad` o historial de compras ya no deben incluirse en los perfiles y segmentaciones de marketing.

**3. Qué mecanismos técnicos podrían separar finalidades:**[cite: 10]
*   **Banderas lógicas (Flags):** Agregar columnas booleanas en la base de datos (ej. `opt_in_marketing = FALSE`) para filtrar a los clientes en las consultas.
*   **Vistas (Views):** Crear vistas específicas para el área secundaria que incluyan una cláusula `WHERE opt_in_marketing = TRUE`, excluyendo automáticamente a quienes ejercieron su derecho.
*   **Control de acceso:** Asegurar mediante roles (RBAC) que las áreas que realizan finalidades secundarias no tengan acceso a la tabla general, sino solo a las vistas filtradas.

**4. Por qué la decisión final no debe ser tomada únicamente por el DBA:**[cite: 10]
Porque atender derechos ARCO es un proceso con implicaciones legales y administrativas[cite: 10]. El área legal o el Oficial de Privacidad debe validar la solicitud, evaluar si procede jurídicamente y documentarla. El DBA actúa como ejecutor técnico únicamente después de recibir la instrucción formal autorizada.
