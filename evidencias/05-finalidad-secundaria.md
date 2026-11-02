# Actividad 5: Analizar una finalidad secundaria

## Contexto
La empresa propone utilizar los datos de clientes para la siguiente finalidad: "Enviar promociones personalizadas basadas en la edad, ciudad y comportamiento de compra."

## Respuestas al Análisis

**1. ¿El hecho de que la organización ya tenga los datos significa automáticamente que puede utilizarlos para cualquier finalidad?**
No. De acuerdo con el principio de **Limitación de Finalidad**, los datos personales solo pueden ser tratados para los propósitos explícitos y legítimos para los cuales fueron originalmente recolectados. Usarlos para marketing constituye una finalidad secundaria que requiere un nuevo fundamento legal (generalmente, el consentimiento explícito del titular).

**2. ¿Qué preguntas debería realizar la organización antes de implementar este tratamiento?**
* ¿Esta nueva finalidad está declarada en nuestro Aviso de Privacidad actual?
* ¿Tenemos el consentimiento explícito (opt-in) de los clientes para recibir marketing?
* ¿Contamos con un mecanismo sencillo para que los usuarios puedan revocar este consentimiento (derecho de oposición/opt-out)?
* ¿Cómo garantizamos que esta información no se comparta con terceros sin autorización?

**3. ¿Qué datos serían realmente necesarios?**
Aplicando el principio de minimización, solo se necesitaría:
* `correo` (canal de envío).
* `edad` (o preferiblemente rango de edad) y `ciudad` (para la segmentación).
* Comportamiento de compra (historial o categorías preferidas).
* *No se requieren:* RFC, teléfono (si la promo es por correo), dirección física exacta, ni código postal.

**4. ¿Necesitaría el área de marketing acceso directo a clientes?**
No. Darles acceso directo a la tabla `clientes` violaría el principio de mínimo privilegio y minimización, ya que expondría datos innecesarios para su labor (como el RFC o el teléfono de soporte).

**5. ¿Qué controles técnicos podrían limitar la información entregada?**
* **Vistas SQL (Views):** Crear una vista específica (`v_marketing_clientes`) que solo exponga el correo, la ciudad y el rango de edad.
* **Control de Acceso Basado en Roles (RBAC):** Crear un rol específico para marketing (`CREATE ROLE marketing`) y otorgarle permisos de solo lectura (`SELECT`) exclusivamente sobre la vista diseñada, denegando el acceso a la tabla base.
