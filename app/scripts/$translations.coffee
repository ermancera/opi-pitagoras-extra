'use strict'


DICT =
  'en':
    ACCRUABLE: 'Accruable'
    ACTION: 'Action'
    ACTIONS: 'Actions'
    ACTIVITY: 'Activity'
    ADD: 'Add'
    AMOUNT: 'Amount'
    ASSIGNED: 'Assigned'
    AVAILABLE: 'Available'
    BENEFS: 'Beneficiaries'
    BUDGET: 'Budget'
    CALENDAR: 'Calendar'
    CANCEL: 'Cancel'
    CHANGELOG: 'Changelog'
    CLOSE: 'Close'
    CODE: 'Code'
    COMPLETED: 'Completed'
    CREATED: 'Created'
    DAILY: 'Daily'
    DASHBOARD: 'Dashboard'
    DATE: 'Date'
    DESCRIPTION: 'Description'
    DETAILS: 'View details'
    DISCHARGED: 'Discharged'
    DOCNUM: 'Doc #'
    DOCSEL: 'Select a document type'
    ENTITY: 'Entity'
    EVIDENCE: 'Evidence'
    FILES: 'Files'
    FILTER: 'Filter by'
    FROZEN: 'For review'
    FULLSCREEN: 'Full screen'
    GLOBAL: 'Progress'
    GOALS: 'Goals'
    HOME: 'Home'
    INVOICES: 'Contracts / Invoices'
    LANG: 'Cambiar a Español'
    LOBBIED: 'Lobbied'
    MODIFIED: 'Modified'
    MONTHLY: 'Monthly'
    MOVING: 'In progress'
    OF: 'of'
    ORDER: 'Order progress by'
    PLEDGED: 'Pledged'
    POLY: 'Polygon'
    PRINT: 'Print'
    PROGRESS: 'Progress'
    PROSEL: 'Select a provider'
    PROVIDER: 'Provider'
    REGISTER: 'Register Progress'
    REPROGRAM: 'Reprogram'
    SAVE: 'Save'
    SEARCH: 'Search'
    SEND: 'Send report'
    STATUS: 'Status'
    SUMMARY: 'Summary'
    SYNC: 'Sync data'
    TODAY: 'Today'
    TOGGLE: 'Toggle navigation'
    TOTAL: 'Assigned Budget'
    TOWN: 'Town'
    TYPE: 'Type'
    UPDESC: 'Only files <= 2MB with JPG, PDF, or XML extension are allowed'
    UPTITLE: 'Click or drag a file here'
    UPLOAD: 'Upload contract/invoice'
    WEEKLY: 'Weekly'

  'es':
    ACCRUABLE: 'Devengado'
    ACTION: 'Acción'
    ACTIONS: 'Acciones'
    ACTIVITY: 'Actividad'
    ADD: 'Agregar'
    AMOUNT: 'Monto'
    ASSIGNED: 'Asignado'
    AVAILABLE: 'Por ejercer'
    BENEFS: 'Beneficiarios'
    BUDGET: 'Presupuesto'
    CALENDAR: 'Calendario'
    CANCEL: 'Cancelar'
    CHANGELOG: 'Resumen de Cambios'
    CLOSE: 'Cerrar'
    CODE: 'Código'
    COMPLETED: 'Completadas'
    CREATED: 'Fecha de creación'
    DAILY: 'Diario'
    DASHBOARD: 'Panel de Control'
    DATE: 'Fecha'
    DESCRIPTION: 'Descripción'
    DETAILS: 'Ver detalles'
    DISCHARGED: 'Pagado'
    DOCNUM: '# Doc'
    DOCSEL: 'Selecciona el tipo de documento'
    ENTITY: 'Entidad'
    EVIDENCE: 'Evidencia'
    FILES: 'Archivos'
    FILTER: 'Filtrar por'
    FROZEN: 'Sin avances'
    FULLSCREEN: 'Pantalla completa'
    GLOBAL: 'Avances'
    GOALS: 'Metas'
    HOME: 'Inicio'
    INVOICES: 'Contratos / Facturas'
    LANG: 'Switch to English'
    LOBBIED: 'Ejercido'
    MODIFIED: 'Última modificación'
    MONTHLY: 'Mensual'
    MOVING: 'En proceso'
    OF: 'de'
    ORDER: 'Ordenar avances por'
    PLEDGED: 'Comprometido'
    POLY: 'Polígono'
    PRINT: 'Imprimir'
    PROGRESS: 'Avances'
    PROSEL: 'Selecciona un proveedor'
    PROVIDER: 'Proveedor'
    REGISTER: 'Registrar Avances'
    REPROGRAM: 'Reprogramar'
    SAVE: 'Guardar'
    SEND: 'Enviar informe'
    SEARCH: 'Buscar'
    STATUS: 'Status'
    SUMMARY: 'Resumen'
    SYNC: 'Sincronizar datos'
    TODAY: 'Hoy'
    TOGGLE: 'Alternar navegación'
    TOTAL: 'Presupuesto Asignado'
    TOWN: 'Municipio'
    TYPE: 'Tipo'
    UPDESC: 'Únicamente archivos con la extensión JPG, PDF o XML no mayores a 2MB'
    UPTITLE: 'Haz click o arrastra tu archivo aquí para subir'
    UPLOAD: 'Subir contrato/factura'
    WEEKLY: 'Semanal'


$translateProvider = ($translateProvider) ->
  $translateProvider
    .preferredLanguage('es')
    .translations('en', DICT.en)
    .translations('es', DICT.es)


translations = (angular.module 'translations', [])
translations.config ['$translateProvider', $translateProvider]
