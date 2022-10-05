-- gestion des journaux (root) --
show binary logs;
flush binary logs; -- force rotation
SHOW MASTER STATUS; -- current log, position