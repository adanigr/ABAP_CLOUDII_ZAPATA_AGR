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

    DATA lv_process TYPE string.

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



    ENDIF.

    out->write( |{ lv_client }-{ lv_status }-{ lv_process }-{ lo_contract->region }| ).
*    out->write( 'Hello World' ).
  ENDMETHOD.
ENDCLASS.
