CLASS zcl_02_contract_logali DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA currency TYPE c LENGTH 3.

    METHODS set_client IMPORTING iv_client   TYPE string
                                 iv_location TYPE string
                       EXPORTING ev_status   TYPE string
                       CHANGING  cv_processs TYPE string.

    METHODS get_client EXPORTING ev_client TYPE string.

    CLASS-METHODS:
      set_cntr_type IMPORTING iv_cntr_typr TYPE string,
      get_cntr_typr EXPORTING ev_cntr_typr TYPE string.

  PROTECTED SECTION.
    DATA creation_date TYPE sydate.
  PRIVATE SECTION.
    DATA client TYPE string.
    CLASS-DATA cntr_type TYPE string.
ENDCLASS.



CLASS zcl_02_contract_logali IMPLEMENTATION.
  METHOD set_client.
    client = iv_client.
  ENDMETHOD.

  METHOD get_client.
    ev_client = client.
  ENDMETHOD.

  METHOD get_cntr_typr.
    ev_cntr_typr = cntr_type.
  ENDMETHOD.

  METHOD set_cntr_type.
    cntr_type = iv_cntr_typr.
  ENDMETHOD.

ENDCLASS.
