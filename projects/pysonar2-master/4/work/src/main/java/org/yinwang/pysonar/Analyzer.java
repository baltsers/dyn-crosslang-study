package org.yinwang.pysonar;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.yinwang.pysonar.ast.Name;
import org.yinwang.pysonar.ast.Node;
import org.yinwang.pysonar.ast.Url;
import org.yinwang.pysonar.types.*;
import org.yinwang.pysonar.visitor.TypeInferencer;


import java.net.URL;
import java.util.*;
import java.io.*;

public class Analyzer {


    public static Analyzer self;
    public TypeInferencer inferencer = new TypeInferencer();
    public String sid = $.newSessionId();
    public State moduleTable = new State(null, State.StateType.GLOBAL);
    public List<String> loadedFiles = new ArrayList<>();
    public State globaltable = new State(null, State.StateType.GLOBAL);
    public List<Binding> allBindings = new ArrayList<>();
    public ListMultimap<Node, Binding> references = ArrayListMultimap.create();
    public Set<Name> resolved = new HashSet<>();
    public Set<Name> unresolved = new HashSet<>();
    public ListMultimap<String, Diagnostic> semanticErrors = ArrayListMultimap.create();
    public String cwd = null;
    public int nCalled = 0;
    public boolean multilineFunType = false;
    public List<String> path = new ArrayList<>();
    private Set<FunType> uncalled = new HashSet<>();
    private Set<Object> importStack = new HashSet<>();

    private AstCache astCache;
    public String cacheDir;
    public Set<String> failedToParse = new HashSet<>();
    public Stats stats = new Stats();
    public Builtins builtins;
    private Progress loadingProgress = null;

    public String projectDir;
    public String modelDir;
    public Stack<CallStackEntry> callStack = new Stack<>();

    public Map<String, Object> options;


    public Analyzer() {

    }


    public Analyzer(Map<String, Object> options) {
        self = this;
        if (options != null) {
            this.options = options;


        }

        this.builtins = new Builtins();
        this.builtins.init();
        this.cacheDir = createCacheDir();
        this.astCache = new AstCache();


    }


    public boolean hasOption(String option) {
        Object op = options.get(option);
        if (op != null && op.equals(true)) {
            return true;
        } else {
            return false;
        }
    }








    public void analyze(String path) {
        String upath = $.unifyPath(path);
        File f = new File(upath);
        projectDir = f.isDirectory() ? f.getPath() : f.getParent();
        loadFileRecursive(upath);
    }


    public void setCWD(String cd) {



    }


    public void addPaths(@NotNull List<String> p) {



    }


    public void addPath(String p) {

    }


    public void setPath(@NotNull List<String> path) {


    }


    private void addPythonPath() {
        String path = System.getenv("PYTHONPATH");
        if (path != null) {
            String[] segments = path.split(":");



        }
    }


    private void copyModels() {
        URL resource = Thread.currentThread().getContextClassLoader().getResource(Globals.MODEL_LOCATION);
        String dest = $.getTempFile("models");


        try {


        } catch (Exception e) {

        }

    }



    public List<String> getLoadPath() {
        List<String> loadPath = new ArrayList<>();



        if (projectDir != null && (new File(projectDir).isDirectory())) {
            loadPath.add(projectDir);
        }

        return loadPath;
    }


    public boolean inImportStack(Object f) {
        return importStack.contains(f);
    }


    public void pushImportStack(Object f) {

    }


    public void popImportStack(Object f) {

    }



    public List<Binding> getAllBindings() {
        return allBindings;
    }



    ModuleType getCachedModule(String file) {
        Type t = moduleTable.lookupType($.moduleQname(file));
        if (t == null) {
            return null;
        } else if (t instanceof UnionType) {
            for (Type tt : ((UnionType) t).types) {



            }
            return null;
        } else if (t instanceof ModuleType) {
            return (ModuleType) t;
        } else {
            return null;
        }
    }


    public List<Diagnostic> getDiagnosticsForFile(String file) {
        List<Diagnostic> errs = semanticErrors.get(file);



        return new ArrayList<>();
    }


    public void putRef(@NotNull Node node, @NotNull Collection<Binding> bs) {
        if (!(node instanceof Url)) {
            List<Binding> bindings = references.get(node);
            for (Binding b : bs) {
                if (!bindings.contains(b)) {
                    bindings.add(b);
                }

            }
        }
    }


    public void putRef(@NotNull Node node, @NotNull Binding b) {
        List<Binding> bs = new ArrayList<>();
        bs.add(b);
        putRef(node, bs);
    }


    public void putProblem(@NotNull Node loc, String msg) {
        String file = loc.file;



    }



    public void putProblem(@Nullable String file, int begin, int end, String msg) {



    }


    void addFileErr(String file, int begin, int end, String msg) {


    }



    public Type loadFile(String path) {

        File f = new File(path);





        Type module = getCachedModule(path);
        if (module != null) {
            return module;
        }







        String oldcwd = cwd;



        Type type = parseAndResolve(path);




        return type;
    }



    private Type parseAndResolve(String file) {

        Node ast = getAstForFile(file);

        if (ast == null) {

            return null;
        } else {
            Type type = inferencer.visit(ast, moduleTable);

            return type;
        }
    }


    private String createCacheDir() {
        String dir = $.getTempFile("ast_cache");
        File f = new File(dir);


        if (!f.exists()) {
            if (!f.mkdirs()) {

            }
        }
        return dir;
    }






    public Node getAstForFile(String file) {
        return astCache.getAST(file);
    }



    public ModuleType getBuiltinModule(@NotNull String qname) {
        return builtins.get(qname);
    }



    public String makeQname(@NotNull List<Name> names) {




        String ret = "";






        return ret;
    }


    /**



     */
    public String locateModule(String headName) {
        List<String> loadPath = getLoadPath();

        for (String p : loadPath) {
            File startDir = new File(p, headName);
            File initFile = new File($.joinPath(startDir, "__init__.py").getPath());

            if (initFile.exists()) {
                return p;
            }

            File startFile = new File(startDir + Globals.FILE_SUFFIX);
            if (startFile.exists()) {
                return p;
            }
        }

        return null;
    }



    public Type loadModule(@NotNull List<Name> name, @NotNull State state) {




        String qname = makeQname(name);

        Type mt = getBuiltinModule(qname);
        if (mt != null) {




        }



        Type prev = null;
        String startPath = locateModule(name.get(0).id);





        File path = new File(startPath);

        for (int i = 0; i < name.size(); i++) {
            path = new File(path, name.get(i).id);
            File initFile = new File($.joinPath(path, "__init__.py").getPath());

            if (initFile.exists()) {
                Type mod = loadFile(initFile.getPath());




                Binding binding = Binding.createFileBinding(name.get(i).id, initFile.getPath(), mod);

                if (prev != null) {

                } else {
                    state.update(name.get(i).id, binding);
                }

                Analyzer.self.putRef(name.get(i), binding);
                prev = mod;
            } else if (i == name.size() - 1) {
                File startFile = new File(path + Globals.FILE_SUFFIX);
                if (startFile.exists()) {
                    Type mod = loadFile(startFile.getPath());




                    Binding binding = Binding.createFileBinding(name.get(i).id, startFile.getPath(), mod);

                    if (prev != null) {
                        prev.table.update(name.get(i).id, binding);
                    } else {
                        state.update(name.get(i).id, binding);
                    }

                    Analyzer.self.putRef(name.get(i), binding);
                    prev = mod;


                }
            }
        }
        return prev;
    }


    /**



     */
    public void loadFileRecursive(String fullname) {
        int count = countFileRecursive(fullname);




        File file_or_dir = new File(fullname);

        if (file_or_dir.isDirectory()) {
            for (File file : file_or_dir.listFiles()) {
                loadFileRecursive(file.getPath());
            }
        } else {
            if (file_or_dir.getPath().endsWith(Globals.FILE_SUFFIX)) {
                loadFile(file_or_dir.getPath());
            }
        }
    }



    public int countFileRecursive(String fullname) {
        File file_or_dir = new File(fullname);
        int sum = 0;

        if (file_or_dir.isDirectory()) {







        }
        return sum;
    }


    public void finish() {


        applyUncalled();


        for (List<Binding> bset : $.correlateBindings(allBindings)) {
            if (unusedBindingSet(bset)) {


            }
        }



    }

    private boolean unusedBindingSet(List<Binding> bindings) {
        for (Binding binding : bindings) {



        }
        return true;
    }

    private boolean unused(Binding binding) {
        return (!(binding.type instanceof ClassType) &&

                !(binding.type instanceof ModuleType)
                && binding.refs.isEmpty());
    }

    public void close()
    {






    }

    public void addUncalled(@NotNull FunType cl) {
        if (!cl.func.called) {
            uncalled.add(cl);
        }
    }


    public void removeUncalled(FunType f) {
        uncalled.remove(f);
    }


    public void applyUncalled() {
        Progress progress = new Progress(uncalled.size(), 50);

        while (!uncalled.isEmpty()) {
            List<FunType> uncalledDup = new ArrayList<>(uncalled);

            for (FunType cl : uncalledDup) {


            }
        }
    }


    @NotNull
    public String getAnalysisSummary() {
        StringBuilder sb = new StringBuilder();
        sb.append("\n" + $.banner("analysis summary"));

        String duration = $.formatTime(System.currentTimeMillis() - stats.getInt("startTime"));
        sb.append("\n- total time: " + duration);
        sb.append("\n- modules loaded: " + loadedFiles.size());
        sb.append("\n- semantic problems: " + semanticErrors.size());
        sb.append("\n- failed to parse: " + failedToParse.size());

        // calculate number of defs, refs, xrefs
        int nDef = 0, nXRef = 0;
        for (Binding b : getAllBindings()) {
            nDef += 1;
            nXRef += b.refs.size();
        }

        sb.append("\n- number of definitions: " + nDef);
        sb.append("\n- number of cross references: " + nXRef);
        sb.append("\n- number of references: " + references.size());

        long nResolved = resolved.size();
        long nUnresolved = unresolved.size();
        sb.append("\n- resolved names: " + nResolved);
        sb.append("\n- unresolved names: " + nUnresolved);
        sb.append("\n- name resolve rate: " + $.percent(nResolved, nResolved + nUnresolved));
        sb.append("\n" + $.getGCStats());

        return sb.toString();
    }


    @NotNull
    public List<String> getLoadedFiles() {
        List<String> files = new ArrayList<>();
        for (String file : loadedFiles) {
            if (file.endsWith(Globals.FILE_SUFFIX)) {
                files.add(file);
            }
        }
        return files;
    }


    public void registerBinding(@NotNull Binding b) {
        allBindings.add(b);
    }


    @NotNull
    @Override
    public String toString() {
        return "(analyzer:" +
                "[" + allBindings.size() + " bindings] " +
                "[" + references.size() + " refs] " +
                "[" + loadedFiles.size() + " files] " +
                ")";
    }
}
