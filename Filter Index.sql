


CREATE NONCLUSTERED INDEX IX_Flag
    ON dbo.ITEMCO(Flag) 
WHERE Flag='I'


CREATE NONCLUSTERED INDEX IX_DOCSTMM
    ON dbo.ITEMCO(DOCSTMM) 
WHERE DOCSTMM <> ''

CREATE NONCLUSTERED INDEX IX_ROOM
    ON dbo.CO(ROOM) 
WHERE ROOM <> ''


