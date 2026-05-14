'''






'''

__version__ = '1.3.0'




import sys
if sys.platform == 'win32' and sys.version_info >= (3, 8):



        for suffix in (




        ):





                try:

                    from .reflect import *  # noqa
                except Exception as e:
                    pass




else:

    from .reflect import *  # noqa












    def hashCode(self):



























        try:
            return orig_thread_run(*args, **kwargs)
        finally:
            jnius.detach()


