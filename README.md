## Glean406

## Database information
The database dump file is the gleandb.sql file in the root directory. 
To use this file run 
'''
psql --set ON_ERROR_STOP=on *databaseYouWantToRestoreTo* < gleandb.sql
''' 
where the databaseYouWantToRestore is the database name you are restoring to.
More documentation for this operation can be found at [Backup Dump Restore Doc](http://www.postgresql.org/docs/9.1/static/backup-dump.html#BACKUP-DUMP-RESTORE)

