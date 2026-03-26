# Users

puts "Creating users..."

userNLP = User.find_or_create_by!(
  name: "Alice Chen",
  email: "achen@ufl.edu",
  lab: "CAP4641 — Natural Language Processing"
)
userBIO = User.find_or_create_by!(
  name: "Marcus Rivera",
  email: "mrivera@ufl.edu",
  lab: "CGS4144 — Bioinformatics"
)
userQM = User.find_or_create_by!(
  name: "Priya Nair",
  email: "pnair@ufl.edu",
  lab: "PHY4605 — Quantum Mechanics"
)
userCV = User.find_or_create_by!(
  name: "James Okafor",
  email: "jokafor@ufl.edu",
  lab: "Image Processing and Computer Vision"
)

# NLP Requests

puts "Creating requests..."

ComputeRequest.find_or_create_by!(
  title: "GPT-2 fine-tuning on UF clinical notes",
  user_id: userNLP.id,
  gpu_count: 4,
  cpu_cores: 8,
  memory_gb: 64,
  hours: 48,
  partition: :gpu,
  priority: :high,
  status: :running,
  notes: "Using HuggingFace Transformers with LoRA adapters"
)

ComputeRequest.find_or_create_by!(
  title: "Word2Vec embedding generation — Reddit corpus",
  user_id: userNLP.id,
  gpu_count: 1,
  cpu_cores: 16,
  memory_gb: 32,
  hours: 12,
  partition: :default,
  priority: :low,
  status: :completed,
  notes: "Using HuggingFace Transformers with LoRA adapters"
)

ComputeRequest.find_or_create_by!(
  title: "Sentiment classifier hyperparameter sweep",
  user_id: userNLP.id,
  gpu_count: 2,
  cpu_cores: 8,
  memory_gb: 32,
  hours: 24,
  partition: :gpu,
  priority: :medium,
  status: :approved,
  notes: "Grid search over learning rate and dropout"
)

ComputeRequest.find_or_create_by!(
  title: "Named entity recognition — PubMed abstracts",
  user_id: userNLP.id,
  gpu_count: 1,
  cpu_cores: 4,
  memory_gb: 16,
  hours: 6,
  partition: :default,
  priority: :low,
  status: :submitted,
  notes: "SpaCy pipeline with custom NER labels"
)

ComputeRequest.find_or_create_by!(
  title: "Transformer attention visualization batch job",
  user_id: userNLP.id,
  gpu_count: 2,
  cpu_cores: 8,
  memory_gb: 64,
  hours: 8,
  partition: :gpu,
  priority: :medium,
  status: :submitted,
  notes: "Generating BertViz outputs for 500 input pairs"
)

# Bioinformatics Requests

ComputeRequest.find_or_create_by!(
  title: "BLAST sequence alignment — maize genome",
  user_id: userBIO.id,
  gpu_count: 1,
  cpu_cores: 32,
  memory_gb: 128,
  hours: 36,
  partition: :bigmem,
  priority: :high,
  status: :running,
  notes: "Comparing 12k novel sequences against NCBI nr database"
)

ComputeRequest.find_or_create_by!(
  title: "RNA-seq differential expression analysis",
  user_id: userBIO.id,
  gpu_count: 1,
  cpu_cores: 16,
  memory_gb: 64,
  hours: 18,
  partition: :default,
  priority: :medium,
  status: :completed,
  notes: "DESeq2 pipeline across 48 tissue samples"
)

ComputeRequest.find_or_create_by!(
  title: "De novo genome assembly — soil microbiome",
  user_id: userBIO.id,
  gpu_count: 1,
  cpu_cores: 40,
  memory_gb: 256,
  hours: 72,
  partition: :bigmem,
  priority: :urgent,
  status: :approved,
  notes: "SPAdes assembler on Oxford Nanopore long reads"
)

ComputeRequest.find_or_create_by!(
  title: "Phylogenetic tree construction — influenza variants",
  user_id: userBIO.id,
  gpu_count: 1,
  cpu_cores: 8,
  memory_gb: 16,
  hours: 4,
  partition: :default,
  priority: :low,
  status: :completed,
  notes: "RAxML maximum likelihood on 200 HA sequences"
)

ComputeRequest.find_or_create_by!(
  title: "Protein structure prediction — novel enzyme candidates",
  user_id: userBIO.id,
  gpu_count: 4,
  cpu_cores: 16,
  memory_gb: 128,
  hours: 48,
  partition: :gpu,
  priority: :high,
  status: :submitted,
  notes: "AlphaFold2 batch run on 30 candidate sequences"
)

# Quantum Mechanics Requests

ComputeRequest.find_or_create_by!(
  title: "Hydrogen atom wavefunction Monte Carlo simulation",
  user_id: userQM.id,
  gpu_count: 1,
  cpu_cores: 24,
  memory_gb: 64,
  hours: 24,
  partition: :default,
  priority: :medium,
  status: :completed,
  notes: "Variational MC with 10M sample points"
)

ComputeRequest.find_or_create_by!(
  title: "Quantum harmonic oscillator eigenstate solver",
  user_id: userQM.id,
  gpu_count: 1,
  cpu_cores: 8,
  memory_gb: 16,
  hours: 2,
  partition: :default,
  priority: :low,
  status: :completed,
)

ComputeRequest.find_or_create_by!(
  title: "Many-body perturbation theory — helium ground state",
  user_id: userQM.id,
  gpu_count: 1,
  cpu_cores: 32,
  memory_gb: 128,
  hours: 48,
  partition: :bigmem,
  priority: :high,
  status: :running,
  notes: "Second-order correction with correlated basis sets"
)

ComputeRequest.find_or_create_by!(
  title: "Spin chain entanglement entropy calculation",
  user_id: userQM.id,
  gpu_count: 2,
  cpu_cores: 16,
  memory_gb: 64,
  hours: 12,
  partition: :gpu,
  priority: :medium,
  status: :rejected,
  notes: "Rejected — identical job submitted last week"
)

ComputeRequest.find_or_create_by!(
  title: "Density functional theory — lithium crystal lattice",
  user_id: userQM.id,
  gpu_count: 2,
  cpu_cores: 40,
  memory_gb: 256,
  hours: 72,
  partition: :bigmem,
  priority: :urgent,
  status: :submitted,
  notes: "VASP relaxation run for 128-atom supercell"
)

# Image Processing/Computer Vision Requests

ComputeRequest.find_or_create_by!(
  title: "YOLOv8 object detection training — campus wildlife",
  user_id: userCV.id,
  gpu_count: 4,
  cpu_cores: 8,
  memory_gb: 64,
  hours: 36,
  partition: :gpu,
  priority: :high,
  status: :approved,
  notes: "Custom dataset of 8k labeled images from campus trail cameras"
)

ComputeRequest.find_or_create_by!(
  title: "Image segmentation — satellite land use classification",
  user_id: userCV.id,
  gpu_count: 2,
  cpu_cores: 8,
  memory_gb: 32,
  hours: 18,
  partition: :gpu,
  priority: :medium,
  status: :running,
  notes: "U-Net on Sentinel-2 multispectral tiles",
)

ComputeRequest.find_or_create_by!(
  title: "Histogram equalization batch — medical X-rays",
  user_id: userCV.id,
  gpu_count: 1,
  cpu_cores: 4,
  memory_gb: 8,
  hours: 1,
  partition: :burst,
  priority: :low,
  status: :completed,
)

ComputeRequest.find_or_create_by!(
  title: "GAN training — synthetic face generation",
  user_id: userCV.id,
  gpu_count: 8,
  cpu_cores: 16,
  memory_gb: 128,
  hours: 72,
  partition: :gpu,
  priority: :urgent,
  status: :submitted,
  notes: "StyleGAN3 for data augmentation in facial recognition study"
)

ComputeRequest.find_or_create_by!(
  title: "Optical flow estimation — drone footage",
  user_id: userCV.id,
  gpu_count: 2,
  cpu_cores: 16,
  memory_gb: 64,
  hours: 24,
  partition: :gpu,
  priority: :medium,
  status: :submitted,
  notes: "RAFT model on 4K stabilized aerial video"
)
