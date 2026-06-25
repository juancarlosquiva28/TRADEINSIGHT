Feature: US01 - Registro de usuario en la plataforma

    Como emprendedor interesado en analizar oportunidades internacionales
    Quiero registrarme mediante correo electrónico y contraseña
    Para acceder a las funcionalidades de análisis, comparación y recomendación de mercados internacionales.

Scenario: E1 - Registro exitoso

    Given que el usuario se encuentra en la pantalla de registro
    When ingresa datos válidos y confirma el registro
    Then el sistema crea la cuenta y redirige al dashboard principal

Examples: INPUT

    | nombre      | correo         | contraseña |
    | Juan Pérez  | user@gmail.com | Trade123   |

Examples: OUTPUT

    | mensaje                    | redirección |
    | Cuenta creada exitosamente | Dashboard   |

Scenario: E2 - Correo ya registrado

    Given que el usuario completa el formulario de registro
    When ingresa un correo que ya existe en la plataforma
    Then el sistema muestra un mensaje de error

Examples: INPUT

    | nombre      | correo         | contraseña |
    | Juan Pérez  | user@gmail.com | Trade123   |

Examples: OUTPUT

    | mensaje                              |
    | El correo ya se encuentra registrado |


Feature: US02 - Inicio de sesión seguro

    Como usuario registrado
    Quiero iniciar sesión en mi cuenta de TradeScope
    Para acceder a mis análisis guardados, recomendaciones y configuraciones personalizadas.

Scenario: E1 - Inicio de sesión exitoso

    Given que el usuario tiene una cuenta registrada
    When ingresa credenciales válidas
    Then el sistema permite el acceso a la plataforma

Examples: INPUT

    | correo         | contraseña |
    | user@gmail.com | Trade123   |

Examples: OUTPUT

    | acción del sistema |
    | acceso concedido   |

Scenario: E2 - Credenciales incorrectas

    Given que el usuario está en la pantalla de inicio de sesión
    When ingresa credenciales incorrectas
    Then el sistema deniega el acceso y muestra un error

Examples: INPUT

    | correo         | contraseña |
    | user@gmail.com | error123   |

Examples: OUTPUT

    | mensaje                  |
    | Credenciales incorrectas |


Feature: US03 - Recuperación de contraseña

    Como usuario de la plataforma
    Quiero recuperar mi contraseña mediante mi correo electrónico
    Para volver a acceder a mi cuenta en caso de olvido.

Scenario: E1 - Envío de enlace de recuperación

    Given que el usuario olvidó su contraseña
    When solicita recuperación con un correo registrado
    Then el sistema envía un enlace de recuperación al correo

Examples: INPUT

    | correo         |
    | user@gmail.com |

Examples: OUTPUT

    | mensaje                         |
    | Enlace de recuperación enviado  |

Scenario: E2 - Correo no registrado

    Given que el usuario solicita recuperación de contraseña
    When ingresa un correo no registrado
    Then el sistema muestra una notificación de error

Examples: INPUT

    | correo             |
    | noexiste@gmail.com  |

Examples: OUTPUT

    | mensaje                  |
    | Correo no registrado     |


Feature: US04 - Personalización del perfil de usuario

    Como usuario de TradeScope
    Quiero editar mi información personal y preferencias
    Para personalizar mi experiencia de uso.

Scenario: E1 - Actualización correcta del perfil

    Given que el usuario accede a la configuración de perfil
    When edita sus datos personales y guarda los cambios
    Then el sistema actualiza el perfil correctamente

Examples: INPUT

    | nombre actualizado | foto         | correo actualizado |
    | Juan Quispe        | perfil.png   | juan@gmail.com     |

Examples: OUTPUT

    | mensaje                      |
    | Perfil actualizado con éxito |

Scenario: E2 - Datos inválidos en el perfil

    Given que el usuario está editando su perfil
    When ingresa datos inválidos
    Then el sistema impide guardar y muestra un error

Examples: INPUT

    | nombre | correo      |
    | Juan   | correo_mal  |

Examples: OUTPUT

    | mensaje                      |
    | Datos inválidos en el perfil |


Feature: US05 - Gestión de preferencias de análisis

    Como usuario que busca internacionalizar productos
    Quiero configurar mis preferencias de análisis y sectores de interés
    Para recibir recomendaciones más relevantes según mi perfil comercial.

Scenario: E1 - Guardado de preferencias

    Given que el usuario accede a la sección de preferencias
    When selecciona industrias y mercados de interés
    Then el sistema guarda las preferencias seleccionadas

Examples: INPUT

    | industria | mercado objetivo |
    | Café       | Europa           |

Examples: OUTPUT

    | mensaje                         |
    | Preferencias guardadas con éxito |

Scenario: E2 - Modificación de preferencias existentes

    Given que el usuario ya configuró preferencias anteriormente
    When modifica sus intereses seleccionados
    Then el sistema actualiza la configuración de recomendaciones

Examples: INPUT

    | industria anterior | nueva industria |
    | Café                | Textiles        |

Examples: OUTPUT

    | mensaje                            |
    | Preferencias actualizadas con éxito |


Feature: US06 - Historial de análisis realizados

    Como usuario de TradeScope
    Quiero visualizar mi historial de búsquedas y análisis anteriores
    Para revisar información consultada previamente y comparar oportunidades internacionales.

Scenario: E1 - Guardado automático del análisis

    Given que el usuario completa un análisis de mercado
    When el proceso finaliza correctamente
    Then el sistema guarda el análisis en el historial del usuario

Examples: INPUT

    | producto | país   |
    | Café     | España |

Examples: OUTPUT

    | acción del sistema      |
    | análisis guardado       |

Scenario: E2 - Consulta de análisis anterior

    Given que el usuario accede al historial de análisis
    When selecciona un análisis previo
    Then el sistema muestra la información almacenada correctamente

Examples: INPUT

    | análisis seleccionado |
    | Café - España         |

Examples: OUTPUT

    | resultado mostrado         |
    | análisis anterior cargado  |


Feature: US07 - Cierre seguro de sesión

    Como usuario de la plataforma
    Quiero cerrar sesión de manera segura
    Para proteger mi información personal y comercial al finalizar el uso de TradeScope.

Scenario: E1 - Cierre exitoso de sesión

    Given que el usuario está autenticado en la plataforma
    When selecciona la opción cerrar sesión
    Then el sistema finaliza la sesión correctamente

Examples: INPUT

    | acción         |
    | cerrar sesión  |

Examples: OUTPUT

    | mensaje                 |
    | Sesión cerrada con éxito |

Scenario: E2 - Acceso privado luego de cerrar sesión

    Given que el usuario cerró sesión
    When intenta acceder a funcionalidades privadas
    Then el sistema solicita autenticación nuevamente

Examples: INPUT

    | módulo solicitado |
    | Dashboard privado |

Examples: OUTPUT

    | mensaje                    |
    | Inicie sesión nuevamente   |


Feature: US08 - Notificaciones de actividad de cuenta

    Como usuario de TradeScope
    Quiero recibir notificaciones sobre accesos, cambios importantes y actividad de mi cuenta
    Para mantener la seguridad y control de mi información.

Scenario: E1 - Notificación por cambio de cuenta

    Given que el usuario modifica información de su cuenta
    When el proceso de actualización finaliza
    Then el sistema notifica al usuario sobre el cambio realizado

Examples: INPUT

    | cambio realizado |
    | cambio de correo |

Examples: OUTPUT

    | notificación                       |
    | Se actualizó la información de cuenta |

Scenario: E2 - Actividad sospechosa detectada

    Given que el sistema detecta actividad sospechosa en la cuenta
    When identifica el evento de riesgo
    Then el sistema notifica inmediatamente al usuario

Examples: INPUT

    | actividad detectada      |
    | inicio de sesión extraño |

Examples: OUTPUT

    | alerta                         |
    | Actividad sospechosa detectada |


Feature: US09 - Búsqueda de oportunidades internacionales por producto

    Como emprendedor interesado en exportar o importar productos
    Quiero ingresar el nombre de un producto
    Para obtener información sobre oportunidades comerciales en mercados internacionales.

Scenario: E1 - Búsqueda exitosa de oportunidades

    Given que el usuario está en la sección de análisis de mercados
    When ingresa el nombre de un producto y ejecuta la búsqueda
    Then el sistema muestra oportunidades internacionales relacionadas

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | mercado recomendado | oportunidad |
    | España              | Alta        |

Scenario: E2 - Producto sin información

    Given que el usuario ingresa un producto no registrado en la base de datos
    When ejecuta la búsqueda
    Then el sistema muestra una notificación indicando que no encontró información

Examples: INPUT

    | producto       |
    | ProductoXYZ    |

Examples: OUTPUT

    | mensaje                      |
    | No se encontró información   |


Feature: US10 - Visualización de demanda internacional

    Como usuario que busca expandir su negocio
    Quiero visualizar el nivel de demanda de mi producto en distintos países
    Para identificar mercados potencialmente rentables.

Scenario: E1 - Demanda mostrada correctamente

    Given que el usuario seleccionó un producto
    When se genera el análisis de demanda
    Then el sistema muestra indicadores de demanda por país

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | país    | demanda |
    | España  | Alta    |

Scenario: E2 - Demanda no disponible

    Given que la información de demanda no está disponible temporalmente
    When el usuario intenta visualizar el análisis
    Then el sistema muestra un mensaje informativo

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | mensaje                         |
    | Demanda temporalmente no disponible |


Feature: US11 - Consulta de regulaciones internacionales

    Como usuario de TradeScope
    Quiero consultar regulaciones y requisitos comerciales de distintos países
    Para comprender las barreras de entrada de cada mercado.

Scenario: E1 - Regulaciones disponibles

    Given que el usuario selecciona un país y producto
    When abre la sección de regulaciones
    Then el sistema muestra los requisitos y restricciones correspondientes

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | regulación                      |
    | Requisitos sanitarios aplicables |

Scenario: E2 - Regulaciones no disponibles

    Given que el país seleccionado no cuenta con datos regulatorios
    When el usuario solicita la información
    Then el sistema muestra una notificación apropiada

Examples: INPUT

    | país     | producto |
    | Islandia | Café     |

Examples: OUTPUT

    | mensaje                         |
    | Regulaciones no disponibles     |


Feature: US12 - Consulta de tratados comerciales

    Como emprendedor interesado en internacionalización
    Quiero visualizar tratados comerciales relacionados con distintos países
    Para evaluar beneficios y ventajas comerciales.

Scenario: E1 - Tratados comerciales encontrados

    Given que el usuario selecciona un país objetivo
    When accede al análisis de tratados
    Then el sistema muestra los acuerdos comerciales aplicables

Examples: INPUT

    | país |
    | Chile |

Examples: OUTPUT

    | tratado             | beneficio |
    | Acuerdo comercial   | Arancel preferencial |

Scenario: E2 - Sin tratados asociados

    Given que el país seleccionado no tiene tratados asociados
    When el usuario revisa la información
    Then el sistema muestra un mensaje informativo

Examples: INPUT

    | país      |
    | País XYZ  |

Examples: OUTPUT

    | mensaje                           |
    | No existen tratados disponibles   |


Feature: US13 - Análisis de costos estimados

    Como usuario que desea evaluar oportunidades internacionales
    Quiero visualizar costos estimados de exportación o importación
    Para reducir la incertidumbre financiera.

Scenario: E1 - Costos calculados correctamente

    Given que el usuario selecciona un país y producto
    When se genera el análisis de costos
    Then el sistema muestra costos logísticos y operativos estimados

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | logística | arancel | operación |
    | 1500 USD  | 200 USD | 300 USD   |

Scenario: E2 - Costos no calculables

    Given que la información de costos no puede calcularse
    When el usuario solicita el análisis
    Then el sistema muestra un aviso de información no disponible

Examples: INPUT

    | país      | producto |
    | País XYZ  | Café     |

Examples: OUTPUT

    | mensaje                          |
    | Información de costos no disponible |


Feature: US14 - Evaluación de nivel de dificultad del mercado

    Como usuario de TradeScope
    Quiero conocer el nivel de dificultad de ingresar a un mercado internacional
    Para evaluar el riesgo de expansión comercial.

Scenario: E1 - Dificultad calculada correctamente

    Given que el usuario completa un análisis de mercado
    When se muestran los resultados
    Then el sistema muestra el nivel de dificultad del mercado

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | nivel de dificultad | explicación          |
    | Medio               | Existen requisitos moderados |

Scenario: E2 - Error en cálculo de dificultad

    Given que falla el cálculo de dificultad
    When el usuario solicita el análisis
    Then el sistema notifica el problema

Examples: INPUT

    | país      | producto |
    | País XYZ  | Café     |

Examples: OUTPUT

    | mensaje                            |
    | No se pudo calcular la dificultad  |


Feature: US15 - Filtrado de mercados internacionales

    Como usuario que busca oportunidades específicas
    Quiero filtrar mercados internacionales según distintos criterios
    Para obtener resultados más relevantes.

Scenario: E1 - Filtros aplicados correctamente

    Given que el usuario visualiza mercados internacionales
    When aplica filtros como región o demanda
    Then el sistema actualiza los resultados mostrados

Examples: INPUT

    | región | demanda |
    | Europa | Alta    |

Examples: OUTPUT

    | resultado filtrado |
    | España             |

Scenario: E2 - Filtros sin resultados

    Given que los filtros seleccionados no devuelven resultados
    When finaliza la búsqueda
    Then el sistema notifica al usuario

Examples: INPUT

    | región     | demanda |
    | Antártida  | Alta    |

Examples: OUTPUT

    | mensaje                       |
    | No se encontraron resultados  |


Feature: US16 - Análisis de oportunidades de exportación

    Como productor local interesado en internacionalizar mis productos
    Quiero analizar oportunidades de exportación
    Para identificar mercados atractivos y accesibles.

Scenario: E1 - Oportunidades de exportación encontradas

    Given que el usuario ingresa un producto para análisis de exportación
    When el proceso finaliza
    Then el sistema muestra mercados potenciales de exportación

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | mercado potencial | oportunidad |
    | Alemania          | Alta        |

Scenario: E2 - Datos incompletos en exportación

    Given que el análisis encuentra datos faltantes
    When el usuario solicita el análisis de exportación
    Then el sistema notifica que existe información incompleta

Examples: INPUT

    | producto |
    | Cacao    |

Examples: OUTPUT

    | mensaje                  |
    | Información incompleta   |


Feature: US17 - Análisis de oportunidades de importación

    Como emprendedor interesado en importar productos
    Quiero analizar mercados internacionales
    Para identificar opciones viables de importación.

Scenario: E1 - Importación recomendada

    Given que el usuario solicita un análisis de importación
    When el proceso finaliza
    Then el sistema muestra mercados o proveedores internacionales recomendados

Examples: INPUT

    | producto |
    | Maquinaria |

Examples: OUTPUT

    | mercado recomendado | riesgo |
    | China               | Medio  |

Scenario: E2 - Información limitada de importación

    Given que el producto seleccionado tiene información limitada
    When el usuario realiza el análisis
    Then el sistema muestra una notificación correspondiente

Examples: INPUT

    | producto |
    | ProductoXYZ |

Examples: OUTPUT

    | mensaje                         |
    | Información de importación limitada |


Feature: US18 - Consulta de barreras comerciales

    Como usuario que evalúa mercados internacionales
    Quiero identificar barreras comerciales y restricciones
    Para evitar riesgos durante procesos de exportación o importación.

Scenario: E1 - Barreras comerciales encontradas

    Given que el usuario selecciona un país
    When abre la sección de barreras comerciales
    Then el sistema muestra restricciones y barreras identificadas

Examples: INPUT

    | país   |
    | Brasil |

Examples: OUTPUT

    | barrera              | nivel |
    | requisito sanitario  | Alto  |

Scenario: E2 - Barreras incompletas

    Given que el mercado seleccionado tiene información incompleta de barreras
    When el usuario accede al análisis
    Then el sistema muestra una advertencia

Examples: INPUT

    | país |
    | Perú |

Examples: OUTPUT

    | mensaje                         |
    | Información de barreras incompleta |


Feature: US19 - Consulta de tendencias de mercado

    Como usuario interesado en expansión comercial
    Quiero visualizar tendencias internacionales relacionadas con mi producto
    Para identificar oportunidades emergentes.

Scenario: E1 - Tendencias mostradas correctamente

    Given que el usuario selecciona una categoría de producto
    When abre la sección de tendencias
    Then el sistema muestra tendencias internacionales del mercado

Examples: INPUT

    | categoría |
    | Café      |

Examples: OUTPUT

    | tendencia              | crecimiento |
    | Consumo de café premium | Alto        |

Scenario: E2 - Tendencias no disponibles

    Given que la información de tendencias no está disponible
    When el usuario solicita el análisis
    Then el sistema muestra un mensaje informativo

Examples: INPUT

    | categoría |
    | ProductoXYZ |

Examples: OUTPUT

    | mensaje                     |
    | Tendencias no disponibles   |


Feature: US20 - Resumen estratégico del análisis

    Como usuario de TradeScope
    Quiero obtener un resumen estratégico de los análisis realizados
    Para comprender rápidamente la viabilidad de un mercado internacional.

Scenario: E1 - Resumen estratégico generado

    Given que el usuario completa un análisis de mercado
    When se generan los resultados
    Then el sistema muestra un resumen estratégico del mercado seleccionado

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | resumen                                  |
    | Mercado viable con demanda alta y riesgo medio |

Scenario: E2 - Resumen con datos incompletos

    Given que los datos del análisis están incompletos
    When se genera el resumen
    Then el sistema notifica que la información es limitada

Examples: INPUT

    | país      | producto |
    | País XYZ  | Café     |

Examples: OUTPUT

    | mensaje                       |
    | Resumen generado con datos limitados |


Feature: US21 - Recomendaciones para iniciar la exportación

    Como productor local interesado en exportar
    Quiero recibir recomendaciones prácticas sobre los primeros pasos del proceso
    Para iniciar un negocio de exportación.

Scenario: E1 - Pasos iniciales de exportación

    Given que el usuario desea exportar su producto
    When accede a la sección de recomendaciones iniciales
    Then el sistema muestra una guía de pasos básicos para iniciar la exportación

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | recomendación                         |
    | Registrar producto y revisar requisitos |

Scenario: E2 - Datos insuficientes del producto

    Given que el usuario ingresó poca información del producto
    When solicita recomendaciones
    Then el sistema muestra una notificación solicitando más datos

Examples: INPUT

    | producto | detalle |
    | Café     | vacío   |

Examples: OUTPUT

    | mensaje                     |
    | Se requiere más información |


Feature: US22 - Detección de mercados emergentes

    Como usuario interesado en expandir mi negocio
    Quiero que la aplicación detecte mercados emergentes
    Para descubrir oportunidades con potencial crecimiento.

Scenario: E1 - Mercados emergentes identificados

    Given que el usuario realiza un análisis de producto
    When el sistema recibe la información
    Then se muestran mercados emergentes con mejor recepción

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | mercado emergente | potencial |
    | Polonia           | Alto      |

Scenario: E2 - Actualización de mercados emergentes

    Given que el usuario ya realizó búsquedas anteriormente
    When explora un nuevo mercado
    Then el sistema muestra información resumida del potencial comercial

Examples: INPUT

    | nuevo mercado |
    | Polonia       |

Examples: OUTPUT

    | resumen                        |
    | Mercado con crecimiento favorable |


Feature: US23 - Alertas ante cambios comerciales

    Como usuario
    Quiero recibir alertas sobre cambios relevantes en mercados internacionales
    Para reaccionar rápidamente ante un riesgo.

Scenario: E1 - Alerta de cambio de mercado

    Given que existe un cambio importante en el mercado analizado
    When el sistema detecta la modificación
    Then el usuario recibe una alerta informativa

Examples: INPUT

    | mercado | cambio detectado |
    | España  | aumento de arancel |

Examples: OUTPUT

    | alerta                         |
    | Cambio relevante en el mercado |

Scenario: E2 - Consulta de alerta recibida

    Given que el usuario recibió una alerta previamente
    When accede al apartado de notificaciones
    Then el sistema muestra el detalle resumido del cambio detectado

Examples: INPUT

    | notificación |
    | Alerta arancel |

Examples: OUTPUT

    | detalle                         |
    | El arancel del mercado cambió    |


Feature: US24 - Priorización de mercados según nivel de riesgo

    Como dueño de una pequeña empresa
    Quiero que la plataforma priorice automáticamente mercados accesibles y estables
    Para tomar decisiones con seguridad y evitar riesgos.

Scenario: E1 - Priorización correcta de mercados

    Given que el usuario completa un análisis internacional
    When el sistema procesa los resultados
    Then se muestran primero los mercados con menor riesgo y mayor accesibilidad

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | mercado | riesgo | accesibilidad |
    | Chile   | Bajo   | Alta          |

Scenario: E2 - Riesgo no calculable

    Given que el sistema no puede calcular correctamente el nivel de riesgo
    When el usuario solicita recomendaciones
    Then se muestra una notificación indicando información insuficiente

Examples: INPUT

    | producto |
    | ProductoXYZ |

Examples: OUTPUT

    | mensaje                         |
    | Información insuficiente para priorizar |


Feature: US25 - Recomendaciones según capacidad de negocio

    Como emprendedor
    Quiero recibir recomendaciones adaptadas a la capacidad de mi negocio
    Para evaluar oportunidades internacionales realistas.

Scenario: E1 - Recomendaciones adaptadas al negocio

    Given que el usuario configura información sobre su negocio
    When solicita recomendaciones
    Then el sistema muestra oportunidades acordes a su capacidad comercial

Examples: INPUT

    | tamaño de negocio | presupuesto |
    | Pequeño           | 5000 USD    |

Examples: OUTPUT

    | oportunidad recomendada |
    | Mercado de bajo costo   |


Feature: US26 - Sugerencia de mercados alternativos

    Como usuario que evalúa mercados internacionales
    Quiero recibir sugerencias automáticas de mercados alternativos
    Para considerar opciones cuando un país presente demasiadas barreras o riesgos.

Scenario: E1 - Mercados alternativos sugeridos

    Given que el usuario analiza un mercado internacional
    When el sistema detecta alto nivel de riesgo o muchas barreras
    Then la plataforma muestra mercados alternativos recomendados

Examples: INPUT

    | mercado analizado | riesgo |
    | España            | Alto   |

Examples: OUTPUT

    | mercado alternativo | motivo         |
    | Chile               | menor riesgo   |

Scenario: E2 - Detalle de recomendación alternativa

    Given que el usuario visualiza mercados alternativos sugeridos
    When desea saber más sobre una opción
    Then el sistema muestra un texto resumido sobre la nueva oportunidad

Examples: INPUT

    | mercado alternativo |
    | Chile               |

Examples: OUTPUT

    | resumen                         |
    | Mercado con menor barrera de entrada |


Feature: US27 - Sugerencias preventivas

    Como usuario interesado en internacionalizar mi pequeña empresa
    Quiero recibir sugerencias preventivas
    Para ajustar mi estrategia de negocio.

Scenario: E1 - Sugerencias preventivas generadas

    Given que el usuario busca internacionalizar su pequeña empresa
    When el sistema identifica riesgos o posibles pérdidas económicas
    Then la aplicación muestra sugerencias preventivas

Examples: INPUT

    | producto | riesgo detectado |
    | Café     | costos altos     |

Examples: OUTPUT

    | sugerencia                         |
    | Revisar costos logísticos antes de exportar |

Scenario: E2 - Rutas preventivas disponibles

    Given que el usuario visualiza sugerencias para prevenir riesgos
    When revisa los detalles
    Then puede visualizar rutas preventivas para su proceso de internacionalización

Examples: INPUT

    | sugerencia seleccionada |
    | Revisar costos          |

Examples: OUTPUT

    | ruta preventiva                  |
    | Comparar proveedores logísticos |


Feature: US28 - Actualización dinámica de recomendados

    Como usuario de TradeScope
    Quiero que las recomendaciones se actualicen automáticamente según cambios del mercado
    Para acceder a información reciente y relevante.

Scenario: E1 - Recomendaciones actualizadas automáticamente

    Given que el sistema detecta cambios importantes en el mercado
    When la información es aprobada
    Then el sistema actualiza las recomendaciones automáticamente

Examples: INPUT

    | mercado | cambio |
    | España  | nueva regulación |

Examples: OUTPUT

    | acción del sistema           |
    | recomendaciones actualizadas |

Scenario: E2 - Nuevas oportunidades mostradas

    Given que el usuario accede a sus recomendaciones guardadas
    When el mercado ha cambiado
    Then el sistema muestra actualizaciones recientes

Examples: INPUT

    | recomendación anterior |
    | Exportar café a España |

Examples: OUTPUT

    | actualización                       |
    | Nueva oportunidad detectada         |


Feature: US29 - Recomendaciones basadas en el historial

    Como usuario frecuente
    Quiero recibir recomendaciones relacionadas con mis búsquedas y análisis anteriores
    Para seguir explorando oportunidades para mi negocio.

Scenario: E1 - Recomendaciones personalizadas por historial

    Given que el usuario es frecuente en la plataforma
    When accede nuevamente a TradeScope
    Then el sistema muestra recomendaciones relacionadas con sus búsquedas previas

Examples: INPUT

    | búsqueda anterior |
    | Café en Europa    |

Examples: OUTPUT

    | recomendación personalizada |
    | Analizar mercado de Alemania |

Scenario: E2 - Acceso a comparación desde recomendación

    Given que el usuario visualiza recomendaciones basadas en historial
    When selecciona una sugerencia recomendada
    Then el sistema muestra la opción de acceder a comparaciones

Examples: INPUT

    | recomendación |
    | Alemania      |

Examples: OUTPUT

    | acción disponible |
    | Comparar mercados  |


Feature: US30 - Recomendaciones según nivel de experiencia

    Como usuario con poca experiencia
    Quiero que las recomendaciones estén adaptadas a mi nivel de conocimiento
    Para comprender mejor las oportunidades disponibles.

Scenario: E1 - Recomendaciones para principiante

    Given que el usuario seleccionó nivel principiante
    When confirma su nivel de experiencia
    Then el sistema muestra información adaptada a su nivel

Examples: INPUT

    | nivel de experiencia |
    | Principiante          |

Examples: OUTPUT

    | tipo de información        |
    | explicación simplificada   |

Scenario: E2 - Lenguaje adaptado en próximas visitas

    Given que el usuario configuró su nivel como principiante
    When vuelve a acceder a la plataforma
    Then el lenguaje y las recomendaciones se adaptan a su perfil

Examples: INPUT

    | configuración guardada |
    | Principiante           |

Examples: OUTPUT

    | mensaje                         |
    | Recomendaciones adaptadas activas |


Feature: US31 - Comparación visual de mercados internacionales

    Como usuario de TradeScope
    Quiero comparar visualmente distintos mercados internacionales
    Para identificar rápidamente cuál representa una mejor oportunidad comercial.

Scenario: E1 - Comparación exitosa de mercados

    Given que el usuario selecciona dos o más países
    When ejecuta la comparación de mercados
    Then el sistema muestra gráficos e indicadores comparativos

Examples: INPUT

    | país 1 | país 2 |
    | Perú   | Chile  |

Examples: OUTPUT

    | resultado de comparación |
    | Chile presenta menor riesgo |

Scenario: E2 - Error al comparar mercados

    Given que la información comparativa no está disponible
    When el usuario intenta comparar mercados
    Then el sistema muestra un mensaje informativo de error

Examples: INPUT

    | país 1 | país 2 |
    | Perú   | PaísXYZ |

Examples: OUTPUT

    | mensaje                         |
    | No se puede realizar la comparación |


Feature: US32 - Visualización gráfica de tendencias internacionales

    Como usuario interesado en oportunidades internacionales
    Quiero visualizar tendencias de mercado mediante gráficos
    Para interpretar fácilmente el comportamiento de los mercados.

Scenario: E1 - Tendencias visualizadas correctamente

    Given que el usuario selecciona un producto
    When accede a la sección de tendencias
    Then el sistema muestra gráficos de tendencias internacionales

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | gráfico mostrado      |
    | Tendencia internacional |

Scenario: E2 - Tendencias no disponibles

    Given que la información de tendencias no está disponible
    When el usuario solicita la visualización
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | producto |
    | ProductoXYZ |

Examples: OUTPUT

    | mensaje                       |
    | No hay tendencias disponibles |


Feature: US33 - Visualización de indicadores de riesgo

    Como usuario de TradeScope
    Quiero visualizar indicadores de riesgo por mercado
    Para evaluar posibles dificultades antes de tomar decisiones comerciales.

Scenario: E1 - Indicadores de riesgo mostrados

    Given que el usuario completa un análisis de mercado
    When se muestran los resultados
    Then el sistema visualiza indicadores de riesgo de manera gráfica

Examples: INPUT

    | mercado |
    | España  |

Examples: OUTPUT

    | indicador | nivel |
    | Riesgo    | Medio |

Scenario: E2 - Error en procesamiento de riesgos

    Given que los datos de riesgo no pueden procesarse
    When el usuario solicita el análisis
    Then el sistema muestra una notificación de error

Examples: INPUT

    | mercado |
    | PaísXYZ |

Examples: OUTPUT

    | mensaje                     |
    | Error al procesar riesgos   |


Feature: US34 - Visualización de costos por categorías

    Como usuario interesado en exportación o importación
    Quiero visualizar costos organizados por categorías
    Para comprender mejor los gastos asociados.

Scenario: E1 - Costos organizados correctamente

    Given que el usuario selecciona un país y producto
    When se genera el análisis de costos
    Then el sistema muestra visualmente costos organizados por categorías

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | categoría | costo |
    | Logística | 1500 USD |

Scenario: E2 - Costos incompletos

    Given que los datos de costos están incompletos
    When el usuario solicita la visualización
    Then el sistema muestra una notificación correspondiente

Examples: INPUT

    | país   | producto |
    | España | Café     |

Examples: OUTPUT

    | mensaje                      |
    | Información de costos incompleta |


Feature: US35 - Dashboard interactivo de análisis

    Como usuario de TradeScope
    Quiero acceder a un dashboard interactivo
    Para visualizar toda la información relevante de manera organizada y dinámica.

Scenario: E1 - Dashboard cargado correctamente

    Given que el usuario accede al dashboard
    When finaliza la carga de información
    Then el sistema muestra los componentes interactivos correctamente

Examples: INPUT

    | sección |
    | Dashboard |

Examples: OUTPUT

    | componente mostrado |
    | Gráficos e indicadores |

Scenario: E2 - Error en carga del dashboard

    Given que ocurre un problema durante la carga
    When el usuario ingresa al dashboard
    Then el sistema muestra un mensaje de carga o error

Examples: INPUT

    | sección |
    | Dashboard |

Examples: OUTPUT

    | mensaje                 |
    | Error al cargar dashboard |


Feature: US36 - Visualización de rankings de mercados

    Como usuario interesado en internacionalización
    Quiero visualizar rankings de mercados
    Para identificar rápidamente los países más recomendados.

Scenario: E1 - Ranking generado correctamente

    Given que el usuario completa un análisis de mercado
    When accede a la sección de rankings
    Then el sistema muestra mercados recomendados ordenados correctamente

Examples: INPUT

    | producto |
    | Café     |

Examples: OUTPUT

    | posición | mercado |
    | 1        | Chile   |

Scenario: E2 - Error en generación de ranking

    Given que no es posible generar el ranking
    When el usuario solicita la visualización
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | producto |
    | ProductoXYZ |

Examples: OUTPUT

    | mensaje                    |
    | No se pudo generar ranking |


Feature: US37 - Comparación de barreras comerciales entre países

    Como usuario de TradeScope
    Quiero comparar barreras comerciales entre distintos países
    Para identificar mercados con menor dificultad de acceso.

Scenario: E1 - Barreras comparadas correctamente

    Given que el usuario selecciona distintos países
    When genera la comparación
    Then el sistema muestra comparativamente las barreras comerciales

Examples: INPUT

    | país 1 | país 2 |
    | Chile  | Brasil |

Examples: OUTPUT

    | comparación                         |
    | Chile tiene menor barrera comercial |

Scenario: E2 - Información incompleta de barreras

    Given que los países seleccionados tienen información incompleta
    When el usuario solicita la comparación
    Then el sistema muestra una notificación correspondiente

Examples: INPUT

    | país 1 | país 2 |
    | Chile  | PaísXYZ |

Examples: OUTPUT

    | mensaje                         |
    | Información incompleta de barreras |


Feature: US38 - Exportación de reportes visuales

    Como usuario de TradeScope
    Quiero exportar reportes visuales de análisis
    Para compartir información y tomar decisiones estratégicas con mi equipo.

Scenario: E1 - Reporte exportado correctamente

    Given que el usuario completa un análisis
    When selecciona la opción exportar reporte
    Then el sistema genera y descarga el reporte visual

Examples: INPUT

    | análisis |
    | Café - España |

Examples: OUTPUT

    | archivo descargado |
    | reporte_visual.pdf |

Scenario: E2 - Error al exportar reporte

    Given que ocurre un error en la generación del reporte
    When el usuario intenta descargarlo
    Then el sistema muestra una notificación de error

Examples: INPUT

    | análisis |
    | Café - España |

Examples: OUTPUT

    | mensaje                    |
    | Error al exportar reporte  |


Feature: US39 - Tutorial de inicio para nuevos usuarios

    Como nuevo usuario de TradeScope
    Quiero ver un tutorial guiado al ingresar por primera vez
    Para comprender cómo utilizar las funcionalidades principales.

Scenario: E1 - Tutorial mostrado automáticamente

    Given que el usuario inicia sesión por primera vez
    When el sistema detecta su primer ingreso
    Then muestra automáticamente un tutorial de bienvenida paso a paso

Examples: INPUT

    | usuario nuevo |
    | sí            |

Examples: OUTPUT

    | pantalla mostrada |
    | Tutorial inicial   |

Scenario: E2 - Omitir tutorial

    Given que el usuario está visualizando el tutorial
    When selecciona la opción omitir
    Then el sistema cierra el tutorial y redirige al usuario a la página principal

Examples: INPUT

    | acción |
    | Omitir |

Examples: OUTPUT

    | redirección |
    | Página principal |


Feature: US40 - Centro de ayuda y preguntas frecuentes

    Como usuario de TradeScope
    Quiero acceder a un centro de ayuda con preguntas frecuentes
    Para resolver dudas sin contactar soporte.

Scenario: E1 - Búsqueda en centro de ayuda

    Given que el usuario accede al centro de ayuda
    When realiza una búsqueda sobre un tema específico
    Then el sistema muestra preguntas frecuentes relacionadas

Examples: INPUT

    | búsqueda |
    | costos   |

Examples: OUTPUT

    | respuesta encontrada |
    | Preguntas sobre costos |

Scenario: E2 - Sin resultados en ayuda

    Given que el usuario realiza una búsqueda en el centro de ayuda
    When no existen resultados relacionados
    Then el sistema muestra un mensaje sugiriendo contactar soporte

Examples: INPUT

    | búsqueda |
    | tema inexistente |

Examples: OUTPUT

    | mensaje                    |
    | Contacte al soporte técnico |


Feature: US41 - Glosario de términos de comercio internacional

    Como usuario sin experiencia en comercio exterior
    Quiero acceder a un glosario con explicaciones simples
    Para comprender mejor la información presentada en la plataforma.

Scenario: E1 - Término explicado correctamente

    Given que el usuario visualiza un término técnico
    When selecciona el término o accede al glosario
    Then el sistema muestra una definición clara y simplificada

Examples: INPUT

    | término |
    | Arancel |

Examples: OUTPUT

    | definición                           |
    | Impuesto aplicado a productos importados |

Scenario: E2 - Término no encontrado

    Given que el usuario busca un término dentro del glosario
    When el término no está registrado
    Then el sistema muestra un mensaje indicando que no está disponible

Examples: INPUT

    | término |
    | ABCXYZ  |

Examples: OUTPUT

    | mensaje                       |
    | Término aún no disponible     |


Feature: US42 - Asistente Inteligente de TradeScope

    Como usuario de TradeScope
    Quiero contar con un asistente inteligente integrado
    Para resolver dudas y recibir ayuda personalizada.

Scenario: E1 - Consulta respondida por IA

    Given que el usuario abre el asistente desde cualquier parte de la plataforma
    When realiza una consulta en lenguaje natural
    Then el sistema genera una respuesta útil según el contexto

Examples: INPUT

    | consulta                            |
    | ¿Cómo comparo mercados?             |

Examples: OUTPUT

    | respuesta                                      |
    | Puedes seleccionar dos países y presionar comparar |

Scenario: E2 - Consulta no resuelta por IA

    Given que la consulta supera las capacidades del asistente
    When el asistente no logra resolver la duda
    Then el sistema ofrece conexión con soporte

Examples: INPUT

    | consulta                   |
    | Necesito ayuda específica   |

Examples: OUTPUT

    | acción del sistema      |
    | conectar con soporte    |


Feature: US43 - Guías paso a paso por funcionalidad

    Como usuario de TradeScope
    Quiero acceder a guías detalladas por funcionalidad
    Para utilizar correctamente el análisis de mercados internacionales.

Scenario: E1 - Guía mostrada correctamente

    Given que el usuario utiliza una funcionalidad de la plataforma
    When selecciona la opción de ayuda de dicha funcionalidad
    Then el sistema muestra una guía paso a paso

Examples: INPUT

    | funcionalidad |
    | Comparación    |

Examples: OUTPUT

    | guía mostrada            |
    | Pasos para comparar mercados |

Scenario: E2 - Guía no disponible

    Given que el usuario intenta acceder a una guía
    When el contenido no está disponible
    Then el sistema redirige al centro de ayuda general

Examples: INPUT

    | funcionalidad |
    | Función nueva  |

Examples: OUTPUT

    | redirección             |
    | Centro de ayuda general |


Feature: US44 - Comunicación con el soporte técnico por consultas

    Como usuario de TradeScope
    Quiero enviar consultas directamente al equipo de soporte
    Para recibir asistencia personalizada.

Scenario: E1 - Consulta enviada correctamente

    Given que el usuario accede al formulario de soporte
    When completa los campos obligatorios y envía la consulta
    Then el sistema confirma el envío y muestra un número de ticket

Examples: INPUT

    | asunto        | mensaje                 |
    | Error costos  | No carga mi análisis    |

Examples: OUTPUT

    | mensaje               | ticket |
    | Consulta enviada       | TCK001 |

Scenario: E2 - Formulario incompleto

    Given que el usuario intenta enviar el formulario de soporte
    When existen campos obligatorios vacíos
    Then el sistema muestra validaciones e impide el envío

Examples: INPUT

    | asunto | mensaje |
    |        |         |

Examples: OUTPUT

    | mensaje                         |
    | Complete los campos obligatorios |


Feature: US45 - Inicio de sesión seguro con autenticación

    Como usuario de TradeScope
    Quiero iniciar sesión de manera segura mediante autenticación
    Para proteger el acceso a mi información personal y comercial.

Scenario: E1 - Autenticación exitosa

    Given que el usuario ingresa credenciales válidas
    When presiona el botón iniciar sesión
    Then el sistema permite el acceso correctamente

Examples: INPUT

    | correo         | contraseña |
    | user@gmail.com | Trade123   |

Examples: OUTPUT

    | acción del sistema |
    | acceso permitido   |

Scenario: E2 - Autenticación fallida

    Given que el usuario ingresa datos incorrectos
    When intenta iniciar sesión
    Then el sistema muestra un error y deniega el acceso

Examples: INPUT

    | correo         | contraseña |
    | user@gmail.com | error123   |

Examples: OUTPUT

    | mensaje           |
    | Acceso denegado   |


Feature: US46 - Visualización de consejos de seguridad

    Como usuario de TradeScope
    Quiero visualizar consejos de seguridad dentro de la plataforma
    Para conocer buenas prácticas de protección de información.

Scenario: E1 - Consejos de seguridad disponibles

    Given que el usuario accede a la sección de seguridad
    When solicita visualizar los consejos disponibles
    Then el sistema muestra correctamente la información de seguridad

Examples: INPUT

    | sección |
    | Seguridad |

Examples: OUTPUT

    | contenido mostrado       |
    | Consejos de seguridad    |

Scenario: E2 - Consejos no disponibles

    Given que no existen consejos de seguridad registrados
    When el usuario accede a la sección correspondiente
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | sección |
    | Seguridad |

Examples: OUTPUT

    | mensaje                        |
    | Consejos no disponibles        |


Feature: US47 - Visualización de consejos para evitar riesgos digitales

    Como usuario de TradeScope
    Quiero visualizar consejos para evitar riesgos digitales
    Para conocer prácticas básicas de seguridad en plataformas digitales.

Scenario: E1 - Consejos digitales mostrados

    Given que el usuario accede a la sección de consejos de seguridad
    When solicita visualizar la información
    Then el sistema muestra correctamente los consejos disponibles

Examples: INPUT

    | sección |
    | Consejos digitales |

Examples: OUTPUT

    | contenido mostrado       |
    | Buenas prácticas digitales |

Scenario: E2 - Consejos digitales no disponibles

    Given que los consejos de seguridad no están disponibles
    When el usuario intenta acceder a la sección correspondiente
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | sección |
    | Consejos digitales |

Examples: OUTPUT

    | mensaje                       |
    | Información no disponible     |


Feature: US48 - Cierre de sesión seguro

    Como usuario de TradeScope
    Quiero cerrar sesión de manera segura
    Para proteger mi información al finalizar el uso de la plataforma.

Scenario: E1 - Cierre de sesión exitoso

    Given que el usuario selecciona la opción cerrar sesión
    When confirma la acción
    Then el sistema finaliza la sesión correctamente

Examples: INPUT

    | acción |
    | Cerrar sesión |

Examples: OUTPUT

    | mensaje                 |
    | Sesión finalizada       |

Scenario: E2 - Acceso luego del cierre

    Given que la sesión finalizó correctamente
    When el usuario intenta acceder a funcionalidades privadas
    Then el sistema solicita autenticación nuevamente

Examples: INPUT

    | módulo |
    | Dashboard privado |

Examples: OUTPUT

    | mensaje                  |
    | Autenticación requerida   |


Feature: US49 - Visualización de políticas de privacidad

    Como usuario de TradeScope
    Quiero visualizar las políticas de privacidad de la plataforma
    Para conocer cómo se maneja mi información dentro del sistema.

Scenario: E1 - Políticas mostradas correctamente

    Given que el usuario accede a la sección de privacidad
    When solicita visualizar la información
    Then el sistema muestra correctamente las políticas de privacidad

Examples: INPUT

    | sección |
    | Privacidad |

Examples: OUTPUT

    | contenido mostrado          |
    | Políticas de privacidad     |

Scenario: E2 - Políticas no disponibles

    Given que la información de privacidad no está disponible
    When el usuario intenta acceder a ella
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | sección |
    | Privacidad |

Examples: OUTPUT

    | mensaje                         |
    | Políticas no disponibles        |


Feature: US50 - Visualización de términos y condiciones

    Como usuario de TradeScope
    Quiero visualizar los términos y condiciones de uso
    Para conocer las normas y condiciones del servicio.

Scenario: E1 - Términos mostrados correctamente

    Given que el usuario accede a la sección de términos y condiciones
    When solicita visualizar la información
    Then el sistema muestra correctamente los términos disponibles

Examples: INPUT

    | sección |
    | Términos y condiciones |

Examples: OUTPUT

    | contenido mostrado           |
    | Términos y condiciones       |

Scenario: E2 - Términos no disponibles

    Given que la información no está disponible
    When el usuario intenta acceder a ella
    Then el sistema muestra una notificación informativa

Examples: INPUT

    | sección |
    | Términos y condiciones |

Examples: OUTPUT

    | mensaje                          |
    | Términos no disponibles          |
