# Actividad 1: Inventario y Finalidad de los Datos

## Matriz de Inventario

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **id** | No | Identificación técnica única y relación en BD | Sí | Sistemas / DBA | Permanente con el registro |
| **nombre** | Sí | Identificación del cliente y facturación | Sí | Atención, Facturación | Fin de relación comercial + 5 años |
| **correo** | Sí | Comunicación, envío de facturas y avisos | Sí | Atención, Facturación | Fin de relación comercial + 5 años |
| **telefono** | Sí | Contacto directo y soporte técnico | Sí | Atención al cliente | Fin de relación comercial + 5 años |
| **rfc** | Sí (Fiscal) | Cumplimiento tributario y facturación | Sí (para facturar) | Facturación / Finanzas | 5 años (obligación fiscal) |
| **edad** | Sí (Cuasi-identificador) | Análisis demográfico y estadístico | Solo para analítica | Analítica (Agregado) | Indefinido (si se anonimiza) |
| **ciudad** | Sí (Cuasi-identificador) | Logística, cobertura y análisis | Sí | Operaciones, Analítica | Fin de relación comercial |
| **codigo_postal**| Sí (Cuasi-identificador) | Envíos físicos y análisis territorial | Sí | Operaciones, Analítica | Fin de relación comercial |
| **fecha_alta** | No | Auditoría y control del ciclo de vida | Sí | Sistemas / DBA | Permanente con el registro |

---

## Justificación de decisiones

1. **`id` y `fecha_alta`**: Son metadatos técnicos y operativos del sistema. No identifican directamente a una persona natural, pero son necesarios para la integridad referencial y la auditoría.
2. **`nombre`, `correo` y `telefono`**: Son datos personales de identificación directa estrictamente necesarios para brindar el servicio, mantener la comunicación operativa y ofrecer soporte. Su acceso debe estar restringido a quienes interactúan con el cliente.
3. **`rfc`**: Es un dato personal sensible de carácter fiscal. Su recolección se justifica únicamente para emitir comprobantes fiscales (CFDI), por lo que su acceso debe limitarse al área contable/facturación y retenerse por el tiempo que exige la ley (5 años).
4. **`edad`, `ciudad` y `codigo_postal`**: Son cuasi-identificadores. Por sí solos pueden no identificar a alguien, pero combinados sí. Son útiles para logística y análisis demográfico, pero para el área de analítica no se requiere el registro exacto de la persona, sino información agregada o anonimizada.

---

## Actividad 2: Principio de Minimización

### Análisis de la solicitud
1. **¿Todos los campos son necesarios para atención al cliente?**
   No. La propuesta original incluía campos excesivos como RFC, edad, ciudad y código postal. Para soporte únicamente se requieren identificadores y datos de contacto directo (nombre, correo, teléfono).
2. **¿Por qué soporte necesitaría conocer el RFC?**
   Soporte no necesita conocerlo. El RFC es un dato de carácter fiscal y su uso debe ser exclusivo para los procesos de facturación y finanzas.
3. **¿Necesita conocer la edad?**
   No. Es un atributo demográfico que no cumple ninguna función operativa al momento de resolver una solicitud de servicio o atención.
4. **¿Necesita conocer el código postal?**
   Para soporte remoto estándar, no es necesario. Solo se justificaría si la atención implicara logística de recolección, envíos físicos o visitas en sitio.
5. **¿Qué principio de privacidad está relacionado con esta decisión?**
   El **Principio de Minimización de Datos** (y proporcionalidad). Este principio establece que el tratamiento de datos personales debe limitarse a lo que es estrictamente adecuado, relevante y necesario para los fines para los que son procesados.

---

## Actividad 3: Separación por Finalidad

### Análisis de la solicitud
**¿Por qué esta información puede ser más apropiada para analítica que entregar directamente la tabla completa de clientes?**

Porque el área de analítica únicamente necesita identificar tendencias, patrones de distribución y estadísticas demográficas para cumplir con su función[cite: 11]; no necesita identificar a personas en específico. 

Al proporcionar información **agregada** (conteos) y **generalizada** (rangos de edad en lugar de edades exactas o fechas de nacimiento), se excluyen por completo los identificadores directos (nombre, correo, teléfono y RFC)[cite: 11]. Esto garantiza que se cumplan los **principios de minimización y separación de finalidad**, protegiendo la privacidad de los usuarios y evitando exponer información sensible a un área que operativamente no la requiere.

---

## Actividad 4: Control de acceso relacionado con la finalidad

### Preguntas de análisis
1. **¿Qué información puede consultar el rol?**
   Únicamente la información de la ciudad y el rango de edad generalizado a través de la vista `v_analitica_clientes`.
2. **¿Puede consultar directamente clientes?**
   No, porque no se le otorgó explícitamente el permiso de lectura (`SELECT`) sobre la tabla base `clientes`.
3. **¿Puede obtener nombre, correo y RFC?**
   No. Esos campos fueron excluidos de la vista `v_analitica_clientes` y el rol carece de acceso a la tabla original que los contiene.
4. **¿Qué principio de privacidad estás aplicando?**
   El **Principio de Minimización de Datos** (junto con Separación por Finalidad), asegurando que los analistas trabajen únicamente con datos agrupados/anonimizados y no con identificadores directos.
5. **¿Qué principio de seguridad estás aplicando?**
   El **Principio de Mínimo Privilegio** (*Least Privilege*), al otorgar estrictamente los permisos indispensables (acceso a la vista y uso del esquema) para que el rol ejecute su función sin exponer la base de datos completa.
