# Actividad 13: Diferenciar controles técnicos y administrativos

## Clasificación de medidas

| Medida | Técnico | Administrativo |
| :--- | :---: | :---: |
| Crear roles de PostgreSQL | X | |
| Política de retención | X | X |
| Cifrado de datos | X | |
| Procedimiento para solicitudes ARCO | | X |
| Vista con información limitada | X | |
| Clasificación de información | | X |
| Registro de auditoría | X | X |
| Política de control de acceso | X | X |

---

## Justificación de medidas con ambos tipos de control

Algunas medidas abarcan ambos dominios porque requieren una regla humana/normativa para existir y una herramienta tecnológica para ejecutarse[cite: 14]:

1. **Política de retención:** 
   * *Administrativo:* Es un documento o lineamiento que dicta los plazos legales y de negocio para conservar la información.
   * *Técnico:* Requiere implementación en la base de datos mediante rutinas, scripts o tareas automatizadas (jobs) que eliminen o purguen los datos una vez vencido el plazo.

2. **Registro de auditoría:**
   * *Administrativo:* Involucra la definición de qué procesos críticos deben ser monitoreados y la asignación de personal (auditores) para revisar las bitácoras periódicamente.
   * *Técnico:* Es la configuración y activación de logs, triggers o extensiones (como `pgaudit`) dentro del motor de base de datos para capturar los eventos.

3. **Política de control de acceso:**
   * *Administrativo:* Es el diseño normativo dictado por la gerencia o el oficial de seguridad sobre el nivel de privilegio que debe tener cada puesto de la organización (matriz de accesos).
   * *Técnico:* Es la ejecución de esa matriz en la base de datos mediante la creación de roles, vistas y comandos `GRANT` / `REVOKE`.
