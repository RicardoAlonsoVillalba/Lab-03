# Actividad 15: Propuesta de arquitectura de datos protegidos

## 1. Mapa Conceptual de la Arquitectura (Separación por Finalidad)

```text
[ BASE DE DATOS CENTRAL ]
   |
   +-- 1. Operación
   |        |-- Datos necesarios para operación: Nombre, Correo, Teléfono, RFC, Transacciones.
   |        |-- Finalidad: Prestar el servicio principal.
   |
   +-- 2. Analítica
   |        |-- Datos agregados: Conteos, rangos de edad, estadísticas por ciudad.
   |        |-- Finalidad: Inteligencia de negocios.
   |
   +-- 3. Auditoría
            |-- Datos técnicos: Usuario DB, fecha/hora, acción, tabla afectada.
            |-- Finalidad: Trazabilidad y cumplimiento.
cat << 'EOF' > evidencias/16-reflexion.md
# Informe Final: Preguntas de reflexión

**1. ¿Una base de datos técnicamente segura necesariamente cumple con todos los requisitos de privacidad?**[cite: 12]
No. La seguridad protege la infraestructura y previene accesos no autorizados, pero la privacidad exige que la recolección sea legal, minimizada, con un propósito específico y consentida. Se puede tener un sistema impenetrable lleno de datos recolectados y utilizados ilegalmente.

**2. ¿Por qué el principio de mínimo privilegio también contribuye a la privacidad?**[cite: 12]
Porque al restringir el acceso solo a los datos estrictamente necesarios para que un usuario realice su trabajo, se evita la exposición innecesaria de información personal (PII), reduciendo el riesgo de uso indebido o filtraciones internas.

**3. ¿Por qué el DBA no debería decidir por sí solo la finalidad del tratamiento de los datos?**[cite: 12]
Porque la finalidad es una definición de negocio y jurídica que debe alinearse con el Aviso de Privacidad y el consentimiento del titular. El DBA es el ejecutor de las medidas técnicas, no el estratega legal de la empresa.

**4. ¿Por qué los desarrolladores no deberían recibir automáticamente copias completas de bases de datos productivas?**[cite: 12]
Para cumplir con el principio de minimización y necesidad. Entregar toda la base expone los datos personales de miles de clientes a personal que solo necesita estructura o datos ficticios (dummy) para programar o hacer pruebas.

**5. ¿Por qué una copia utilizada para desarrollo también puede representar un riesgo de privacidad?**[cite: 12]
Los entornos de desarrollo suelen tener controles de seguridad más laxos, mayor rotación de personal y exposición a herramientas externas. Si la copia contiene información personal real, es un punto altamente vulnerable para una brecha de datos.

**6. ¿Por qué la retención debe formar parte del ciclo de vida de los datos?**[cite: 12]
Porque el principio de minimización prohíbe almacenar datos indefinidamente. Los datos personales deben ser purgados, destruidos o anonimizados de forma segura una vez que la finalidad que justificó su recolección original haya concluido.

**7. ¿Qué relación existe entre privacidad por diseño y diseño de bases de datos?**[cite: 12]
La privacidad por diseño exige que la protección de datos se integre desde la creación de las tablas y relaciones (esquema), evitando campos innecesarios, segregando los datos sensibles en tablas restringidas e implementando vistas para limitar la exposición, en lugar de intentar añadir parches de seguridad a posteriori.

**8. ¿Qué controles técnicos implementarías para reducir el riesgo de exposición de datos personales?**[cite: 12]
*   Control de Acceso Basado en Roles (RBAC) y vistas con información limitada.
*   Cifrado de datos en reposo y tránsito.
*   Enmascaramiento de datos (Data Masking) para entornos no productivos.
*   Logs de auditoría inmutables (ej. `pgaudit`).
*   Procedimientos automatizados para la retención y el borrado seguro.

**9. ¿Qué información debería conocer un DBA para responder técnicamente a una solicitud ARCO?**[cite: 12]
Debe conocer el ecosistema y flujo completo de los datos: en qué tablas principales residen, qué llaves foráneas y dependencias existen, si hay información replicada en data warehouses, y los tiempos de retención de las copias de seguridad para garantizar que una modificación o borrado se aplique de manera integral.

**10. ¿Qué responsabilidades deberían corresponder al DBA, al responsable de privacidad, al área jurídica y al propietario de los datos?**[cite: 12]
*   **Responsable de privacidad / Jurídico:** Determinar la base legal, aprobar las finalidades, redactar el Aviso de Privacidad, validar las políticas de retención y autorizar administrativamente las solicitudes ARCO.
*   **Propietario del proceso (Business Owner):** Definir qué datos son necesarios recolectar para el funcionamiento de su área (ej. Ventas, RH).
*   **DBA:** Traducir esas políticas legales a controles técnicos (cifrado, roles, vistas, auditoría) y ejecutar físicamente las solicitudes ARCO autorizadas en los sistemas.
