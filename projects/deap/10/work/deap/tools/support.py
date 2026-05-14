

try:
    import cPickle as pickle
except ImportError:













    """Returns directly the argument *obj*.
    """



    """The :class:`History` class helps to build a genealogy of all the














































    """
    def __init__(self):





        """Update the history with the new *individuals*. The index present in
















        """
        try:
            parent_indices = tuple(ind.history_index for ind in individuals)
        except AttributeError:
            parent_indices = tuple()










        """Property that returns an appropriate decorator to enhance the






        """
        def decFunc(func):



                return individuals




        """Provide the genealogy tree of an *individual*. The individual must











        """


        def genealogy(index, depth):









                    genealogy(ind, depth)





    """Object that compiles statistics on a list of arbitrary objects.






















    """
    def __init__(self, key=identity):





        """Register a *function* that will be applied on the sequence each









        """




        """Apply to the input sequence *data* each registered function



        """



        for key, func in self.functions.iteritems():
            entry[key] = func(values)



    """Dictionary of :class:`Statistics` object allowing to compute

















    """
    def compile(self, data):
        """Calls :meth:`Statistics.compile` with *data* of each



        """

        for name, stats in self.items():
            record[name] = stats.compile(data)







        """Register a *function* in each :class:`Statistics` object.








        """
        for stats in self.values():
            stats.register(name, function, *args, **kargs)


    """Evolution records as a chronological list of dictionaries.










    """

    def __init__(self):


        """Dictionary containing the sub-sections of the logbook which are also
































        """



        """Order of the columns to print when using the :data:`stream` and











        """


        """Tells the log book to output or not the header when streaming the


        """


        """Enter a record of event in the logbook as a list of key-value pairs.




        """

        for key, value in infos.items():




                del infos[key]



        """Return a list of values associated to the *names* provided

























        """
        if len(names) == 1:
            return [entry.get(names[0], None) for entry in self]




        """Retrieve the formatted not streamed yet entries of the database











        """




        if isinstance(key, slice):



                    chapter.pop(i)
        else:


                chapter.pop(key)


        """Retrieve and delete element *index*. The header and stream will be










        """
        if index < self.buffindex:










































                        header[i].append(" " * length)






















    """The hall of fame contains the best individual that ever lived in the


















    """
    def __init__(self, maxsize, similar=eq):






        """Update the hall of fame with the *population* by replacing the






        """
        for ind in population:










                        break








        """Insert a new individual in the hall of fame using the









        """






        """Remove the specified *index* from the hall of fame.


        """

























    """The Pareto front hall of fame contains all the non-dominated individuals















    """
    def __init__(self, similar=eq):



        """Update the Pareto front hall of fame with the *population* by adding






        """
        for ind in population:







                    break



























