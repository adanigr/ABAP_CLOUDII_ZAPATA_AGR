CLASS zcl_02_contract_logali DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_address,
             country     TYPE string,
             city        TYPE string,
             postal_code TYPE string,
             region      TYPE string,
             street      TYPE string,
             number      TYPE string,
           END OF ty_address,
           tty_address TYPE TABLE OF ty_address.

    "Reserved word to declare static variables.
    CLASS-DATA currency TYPE c LENGTH 3.

    "A reserved keyword is used to declare the variable 'vars' as an instance
    DATA region TYPE string.

    METHODS: "Reserved word to declare instance methods.

*      "Method declaration with parameter passing by reference
*      set_client IMPORTING iv_client   TYPE string
*                           iv_location TYPE string
*                 EXPORTING ev_status   TYPE string
*                 CHANGING  cv_processs TYPE string,

      "Method declaration with parameters passed by value
      set_client IMPORTING VALUE(iv_client)   TYPE string
                           VALUE(iv_location) TYPE string
                 EXPORTING VALUE(ev_status)   TYPE string
                 CHANGING  VALUE(cv_processs) TYPE string.

    METHODS get_client EXPORTING ev_client TYPE string.

    CLASS-METHODS: "Reserved keyword to declare static methods.
      set_cntr_type IMPORTING iv_cntr_typr TYPE string,
      get_cntr_typr EXPORTING ev_cntr_typr TYPE string.


    "Functional method declaration
    METHODS get_client_name IMPORTING iv_client_id          TYPE string
                            RETURNING VALUE(rv_client_name) TYPE string.

    METHODS set_address IMPORTING it_address TYPE tty_address.

  PROTECTED SECTION.
    DATA creation_date TYPE sydate.
  PRIVATE SECTION.
    DATA client TYPE string.
    CLASS-DATA cntr_type TYPE string.
ENDCLASS.



CLASS zcl_02_contract_logali IMPLEMENTATION.
  METHOD set_client.
    client = iv_client.
    ev_status = 'OK'.
    cv_processs = 'Started'.
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

  METHOD get_client_name.
    CASE iv_client_id.
      WHEN '01'.
        rv_client_name = 'Client Name 01'.
      WHEN '02'.
        rv_client_name = 'Client Name 02'.
    ENDCASE.
  ENDMETHOD.

  METHOD set_address.

  ENDMETHOD.

ENDCLASS.
