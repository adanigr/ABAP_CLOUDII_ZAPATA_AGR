CLASS zcl_exec_log_0367 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exec_log_0367 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'Hello Zapata AGR' ).
  ENDMETHOD.
ENDCLASS.
