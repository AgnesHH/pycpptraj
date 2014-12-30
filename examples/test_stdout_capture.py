import sys
import StringIO
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.utils.decorator import stdout_redirect

# FIXME: cant not capture ar.help() to text
ar = Action_Rmsd()

s = StringIO.StringIO()
sys.stdout = s
with stdout_redirect(StringIO.StringIO()) as out:
    ar.help()

