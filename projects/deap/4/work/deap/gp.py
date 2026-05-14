














"""The :mod:`gp` module provides the methods and classes to perform




"""
























class PrimitiveTree(list):
    """Tree specifically formatted for optimization of genetic





    """

    def __init__(self, content):










        if isinstance(key, slice):
            if key.start >= len(self):
                raise IndexError("Invalid slice object (try to assign a %s"




                                 % (key, len(self)))




                raise ValueError("Invalid slice assignation : insertion of"





                                 " would produce an orphan node (the 6).")


            raise ValueError("Invalid node replacement with a node of a"
                             " different arity.")



        """Return the expression in a human readable string.
        """


        for node in self:





                    break  # If stack is empty, all nodes should have been seen






        """Try to convert a string expression into a PrimitiveTree given a






        """



        for token in tokens:










                if type_ is not None and not issubclass(primitive.ret, type_):
                    raise TypeError("Primitive {} return type {} does not "

                                    .format(primitive, primitive.ret, type_))





                try:
                    token = eval(token)
                except NameError:






                    raise TypeError("Terminal {} type {} does not "

                                    .format(token, type(token), type_))






        """Return the height of the tree, or the depth of the

        """


        for elem in self:


            stack.extend([depth + 1] * elem.arity)




        """Root of the tree, the element 0 of the list.
        """



        """Return a slice object that corresponds to the


        """


        while total > 0:

            end += 1




    """Class that encapsulates a primitive and when called with arguments it





    """


    def __init__(self, name, args, ret):












            return all(getattr(self, slot) == getattr(other, slot)
                       for slot in self.__slots__)





    """Class that encapsulates terminal primitive in expression. Terminals can

    """


    def __init__(self, terminal, symbolic, ret):














            return all(getattr(self, slot) == getattr(other, slot)
                       for slot in self.__slots__)





    """Class that encapsulates a terminal which value is set when the



    """

    def __init__(self):




        """Return a random value used to define the ephemeral state.
        """




    """Class that contains the primitives that can be used to solve a


    """

    def __init__(self, name, in_types, ret_type, prefix="ARG"):



















            self.terms_count += 1

    def renameArguments(self, **kargs):
        """Rename function arguments with new names from *kargs*.
        """
        for i, old_name in enumerate(self.arguments):















                                new_list.append(item)






        if isinstance(prim, Primitive):


                addType(self.terminals, type_)









        """Add a primitive to the set.






        """
        if name is None:
            name = primitive.__name__


        assert name not in self.context or \
               self.context[name] is primitive, \
            "Primitives are required to have a unique name. " \








        """Add a terminal to the set. Terminals can be named










        """

        if name is None and callable(terminal):
            name = terminal.__name__



















        """Add an ephemeral constant to the set. An ephemeral constant







        """

        if name not in module_gp:
            class_ = type(name, (Ephemeral,), {'func': staticmethod(ephemeral),
                                               'ret': ret_type})



            if issubclass(class_, Ephemeral):
                if class_.func is not ephemeral:
                    raise Exception("Ephemerals with different functions should "
                                    "be named differently, even between psets.")

                    raise Exception("Ephemerals with the same name and function "
                                    "should have the same type, even between psets.")

                raise Exception("Ephemerals should be named differently "
                                "than classes defined in the gp module.")





        """Add an Automatically Defined Function (ADF) to the set.



        """






        """Return the ratio of the number of terminals on the number of all

        """




    """Class same as :class:`~deap.gp.PrimitiveSetTyped`, except there is no

    """

    def __init__(self, name, arity, prefix="ARG"):




        """Add primitive *primitive* with arity *arity* to the set.


        """
















def compile(expr, pset):
    """Compile the expression *expr*.








    """

    if len(pset.arguments) > 0:



        code = "lambda {args}: {code}".format(args=args, code=code)
    try:
        return eval(code, pset.context, {})
    except MemoryError:





                            "DEAP will now abort."), traceback



    """Compile the expression represented by a list of trees. The first














    """


    for pset, subexpr in reversed(zip(psets, expr)):


        adfdict.update({pset.name: func})







    """Generate an expression where each leaf has the same depth









    """

    def condition(height, depth):

        return depth == height





    """Generate an expression where each leaf might have a different depth









    """

    def condition(height, depth):
        """Expression generation stops when the depth is equal to height

        """
        return depth == height or \
               (depth >= min_ and random.random() < pset.terminalRatio)





    """Generate an expression with a PrimitiveSet *pset*.










    """





    """


    """
    warnings.warn("gp.genRamped has been renamed. Use genHalfAndHalf instead.",
                  FutureWarning)




    """Generate a Tree as a list of list. The tree is build














    """
    if type_ is None:







            try:
                term = random.choice(pset.terminals[type_])
            except IndexError:



                                  "none available." % (type_,), traceback
            if isclass(term):
                term = term()


            try:
                prim = random.choice(pset.primitives[type_])
            except IndexError:



                                  "none available." % (type_,), traceback

            for arg in reversed(prim.args):
                stack.append((depth + 1, arg))








    """Randomly select crossover point in each individual and exchange each





    """
    if len(ind1) < 2 or len(ind2) < 2:













            types1[node.ret].append(idx)


















    """Randomly select crossover point in each individual and exchange each














    """

    if len(ind1) < 2 or len(ind2) < 2:















            types1[node.ret].append(idx)
























    """Randomly select a point in the tree *individual*, then replace the







    """








    """Replaces a randomly chosen primitive from *individual* by a randomly





    """
    if len(individual) < 2:








            term = term()









    """This operator works on the constants of the tree *individual*. In








    """
    if mode not in ["one", "all"]:
        raise ValueError("Mode must be one of \"one\" or \"all\"")

    ephemerals_idx = [index
                      for index, node in enumerate(individual)
                      if isinstance(node, Ephemeral)]

    if len(ephemerals_idx) > 0:

            ephemerals_idx = (random.choice(ephemerals_idx),)








    """Inserts a new branch at a random position in *individual*. The subtree








    """









    if len(primitives) == 0:










                term = term()









    """This operator shrinks the *individual* by choosing randomly a branch and




    """

    if len(individual) < 3 or individual.height <= 1:





            iprims.append((i, node))






















    """Implement a static limit on some measurement on a GP tree, as defined

























    """

    def decorator(func):






                    new_inds[i] = random.choice(keep_inds)











def harm(population, toolbox, cxpb, mutpb, ngen,

         stats=None, halloffame=None, verbose=__debug__):
    """Implement bloat control on a GP evolution using HARM-GP, as defined in
















































    """

    def _genpop(n, pickfrom=[], acceptfunc=lambda s: True, producesizes=False):











        while len(producedpop) < n:
            if len(pickfrom) > 0:






                        producedpopsizes.append(len(aspirant))
            else:



                    aspirant1, aspirant2 = toolbox.mate(*map(toolbox.clone,
                                                             toolbox.select(population, 2)))

                    if acceptfunc(len(aspirant1)):


                            producedpopsizes.append(len(aspirant1))







                    if opRandom - cxpb < mutpb:






                            producedpopsizes.append(len(aspirant))
























































            return (gamma * len(population) * math.log(2) /

                                                (x - cutoffsize) / halflifefunc(x))

        targethist = [naturalhist[binidx] if binidx <= cutoffsize else
                      targetfunc(binidx) for binidx in range(len(naturalhist))]




        def probfunc(s):
            return probhist[s] if s < len(probhist) else targetfunc(s)






        offspring = _genpop(len(population), pickfrom=naturalpop,
                            acceptfunc=acceptfunc, producesizes=False)




        for ind, fit in zip(invalid_ind, fitnesses):
            ind.fitness.values = fit


















    """Construct the graph of a tree expression. The tree expression must be





















































    """





    for i, node in enumerate(expr):


            stack[-1][1] -= 1













    """


























    """
    for p in ['lf', 'mul', 'add', 'sub']:
        assert p in pset.mapping, "A '" + p + "' function is required in order to perform semantic mutation"

























    """































    """
    for p in ['lf', 'mul', 'add', 'sub']:
        assert p in pset.mapping, "A '" + p + "' function is required in order to perform semantic crossover"































