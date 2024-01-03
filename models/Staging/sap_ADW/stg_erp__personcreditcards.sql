with
fonte_personcreditcards as(
    select
    cast (businessentityid as int) as entidade_de_negocio
    , cast (creditcardid as int) as id_cartao_de_credito
   -- , cast (modifieddate as int) as
    from {{ source('erp', 'personcreditcard') }}
)
select *
from fonte_personcreditcards
