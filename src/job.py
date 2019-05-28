#  actual file where work is done


from get_config import read_config
from rq_config import conn
from rq.decorators import job

CFG = read_config()


@job(CFG['QUEUES']['QU_TEST'], connection=conn, timeout='3h')
def do_work(input_image):

    print('working on input', input_image)

    # ....do something, write output, etc
