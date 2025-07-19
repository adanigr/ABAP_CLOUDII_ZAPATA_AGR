CLASS zcl_01_exec_logali DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_exec_logali IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*/* Commented block to see the different ways of instantiating a class. */
*    DATA lo_contract TYPE REF TO zcl_02_contract_logali.
*
*    CREATE OBJECT lo_contract.
*
*    lo_contract = NEW #( ).

    DATA(lo_contract) = NEW zcl_02_contract_logali(  ).
    DATA(lo_contract2) = NEW zcl_02_contract_logali(  ).

    DATA lv_process TYPE string.

    DATA lt_address TYPE zcl_02_contract_logali=>tty_address.
    DATA ls_address TYPE zcl_02_contract_logali=>ty_address.

    "We check if the object instance was created
    IF lo_contract IS BOUND.

      lo_contract->set_client(
        EXPORTING
          iv_client   = 'Logali'
          iv_location = space
      IMPORTING
        ev_status   = DATA(lv_status)
        CHANGING
          cv_processs = lv_process
      ).

      "Alternative way to call the method as done in line 30.
*      CALL METHOD lo_contract->set_client
*        EXPORTING
*          iv_client   =
*          iv_location =
**        IMPORTING
**          ev_status   =
*        CHANGING
*          cv_processs =
*        .

      "Calling instance methods
      lo_contract->get_client(
        IMPORTING
          ev_client = DATA(lv_client)
      ).

      "Setting instance variables
      lo_contract->region = 'EU'.

      "Call functional method
      DATA(lv_client_name) = lo_contract->get_client_name( iv_client_id = '01' ).

      IF NOT lv_client_name IS INITIAL.
        out->write( lv_client_name ).
      ENDIF.

    ENDIF.

    zcl_02_contract_logali=>set_cntr_type( iv_cntr_typr = 'Construction' ).

    zcl_02_contract_logali=>get_cntr_typr(
      IMPORTING
        ev_cntr_typr = DATA(lv_cntr_type)
    ).

    zcl_02_contract_logali=>currency = 'USD'.

    "Example to show that instance objects share the same value for static methods or variables across all instances.
*    out->write( lo_contract->currency ).
*    out->write( lo_contract2->currency ).

    out->write( zcl_02_contract_logali=>currency ).

    out->write( |{ lv_client }-{ lv_status }-{ lv_process }-{ lo_contract->region }| ).

    out->write( lv_cntr_type ).
*    out->write( 'Hello World' ).
  ENDMETHOD.
ENDCLASS.
