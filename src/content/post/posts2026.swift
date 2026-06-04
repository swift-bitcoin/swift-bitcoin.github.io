let post17 = Post("/post/2026-06-04-progress-report", "Progress Report (June 2026)", "2026-06-04T12:00:00Z", .announcements) { """

In the last three months Swift Bitcoin has matured with a focus on cementing transaction policy, consensus rules and node behavior taking cues from the reference implementation.

# Project Updates

With Mainnet activated, all tooling set for monitoring and essential Initial Block Download (IBD) optimizations in place, the focus during this past quarter shifted to filling in the gaps necessary for a stable 1.0 release.

Performance remained a subject of improvement as well as an emphasis in protocol correctness and functional parity with the Bitcoin Core reference implementation between the areas of transaction acceptance policy (standard-ness) and consensus rules.

The public Swift API was refined and documented further, particularly in what concerns the base protocol and wallet libraries. Additionally the RPC and command line interfaces were also fine tuned. Notably the configuration format was expanded to include a consistent hierarchy of program arguments, environment variables, Swift manifest or JSON files.

Below are the most notable issues/pull requests closed in the last three months organized by focus area:

## API and configuration

- Integrate Apple's Swift Configuration package
 [#546](https://github.com/swift-bitcoin/swift-bitcoin/issues/546) [#549](https://github.com/swift-bitcoin/swift-bitcoin/pull/549)
 - Cleaned up output type solver [#540](https://github.com/swift-bitcoin/swift-bitcoin/pull/540)

## Performance and monitoring

- Recreate bitcoin core caches for block index and UTXO set [#423](https://github.com/swift-bitcoin/swift-bitcoin/issues/423)
- Switch standard metrics backend from statsd to OTel [#534](https://github.com/swift-bitcoin/swift-bitcoin/issues/534) [#537](https://github.com/swift-bitcoin/swift-bitcoin/pull/537)
- Integrate Swift System Metrics [#535](https://github.com/swift-bitcoin/swift-bitcoin/issues/535)
- Updated building guide with metrics documentation [#538](https://github.com/swift-bitcoin/swift-bitcoin/pull/538)

## Node behavior

- Track peers' best known header, chainwork and last common block. Use instead of height [#531](https://github.com/swift-bitcoin/swift-bitcoin/issues/531)
- Track peers' best header and last common ancestor block [#536](https://github.com/swift-bitcoin/swift-bitcoin/pull/536)
- Replicate Bitcoin Core logic for finding the next blocks to download from peers [#533](https://github.com/swift-bitcoin/swift-bitcoin/issues/533)
- Download blocks in parallel and from various sources during IBD [#428](https://github.com/swift-bitcoin/swift-bitcoin/issues/428) [#532](https://github.com/swift-bitcoin/swift-bitcoin/pull/532)
- Auto-connect to multiple peers [#525](https://github.com/swift-bitcoin/swift-bitcoin/issues/525) [#529](https://github.com/swift-bitcoin/swift-bitcoin/pull/529)
- Single headers sync node, except when close to the headers tip[#526](https://github.com/swift-bitcoin/swift-bitcoin/issues/526) [#527](https://github.com/swift-bitcoin/swift-bitcoin/pull/527)

## Consensus

- Missing consensus rules and limits checks [#548](https://github.com/swift-bitcoin/swift-bitcoin/pull/548)
- Full block validation logic including transactions [#137](https://github.com/swift-bitcoin/swift-bitcoin/issues/137)
- Chainwork calculation (strongest, not longest chain) [#246](https://github.com/swift-bitcoin/swift-bitcoin/issues/246)

## Policy

- Standard transaction/script resource limits    [#92](https://github.com/swift-bitcoin/swift-bitcoin/issues/92)
- Standard limits, mainly sigops [#541](https://github.com/swift-bitcoin/swift-bitcoin/pull/541)
- Output types and scriptSig standard-ness [#55](https://github.com/swift-bitcoin/swift-bitcoin/issues/55)
- Standard transaction checking [#36](https://github.com/swift-bitcoin/swift-bitcoin/issues/36)
- Implement policy via mempool pre-checks [#539](https://github.com/swift-bitcoin/swift-bitcoin/pull/539)

## Bug fixes

- Detect client channel closures (crash after outgoing peer disconnection after handshake) [#573](https://github.com/swift-bitcoin/swift-bitcoin/pull/573) [#523](https://github.com/swift-bitcoin/swift-bitcoin/pull/523)

# Plans for the remainder of the year

With the current [OpenSats](https://opensats.org) commitment ending, the goal going forward is to keep iterating over alpha releases until reaching API stability. There's still a backlog of about 65 [issues](https://github.com/swift-bitcoin/swift-bitcoin/issues) out of which 24 are reserved for potential contributors as they are tagged with _Good First Issue_. The rest will be prioritized by impact on the package's public interface, key performance bottlenecks and other issues.

There's a plan to increase the test coverage by continuing to port data driven tests from Bitcoin Core. Same goes for benchmarking. One idea still under review is to build a GUI client to explore the usability of the framework by dog-fooding. This may compensate for the general shortage of voluntary beta testers observed so far since the project started.

New developments from the Swift open source community and Apple must be taken into account as the language is still lacking in specific aspects of system's development, namely: `OutputSpan` support, _new_ Codable and more. In the meantime we intend to increase adoption of cutting edge language features like `~Copyable` `~Escapable`, Inline Arrays, C++ interoperability annotations, …

Project's kanban board outlining the current commitment [here](https://github.com/orgs/swift-bitcoin/projects/3).
""" }

let post16 = Post("/post/2026-03-03-progress-report", "Progress Report (March 2026)", "2026-03-03T12:00:00Z", .announcements) { """

During this past quarter daemon performance and observability have been the primary objective while also filling in important protocol functionality. 

# Project Updates

The latest development activity was primarily on three general areas:
- Activating the mainnet chain selection option, testing and fixing any additional protocol issues not identified during the testnet phase.
- Profiling and benchmarking the performance of the Initial Block Download (IBD) _as is_ for comparison after optimizations are introduced.
- Optimizing IBD and other related functionality while verifying performance increases.

On the mainnet activation front the following tasks were executed:

- Mainnet consensus chain parameters configured. [#492](https://github.com/swift-bitcoin/swift-bitcoin/issues/492) [#500](https://github.com/swift-bitcoin/swift-bitcoin/pull/500)

- Mainnet chain selection configuration and command line argument made default and honored. [#500](https://github.com/swift-bitcoin/swift-bitcoin/pull/500)

- Auto-connect to peers from seeded nodes (hard-coded). [#500](https://github.com/swift-bitcoin/swift-bitcoin/pull/500)

- Full compatibility with Bitcoin Core block file format. [#494](https://github.com/swift-bitcoin/swift-bitcoin/pull/494) [#499](https://github.com/swift-bitcoin/swift-bitcoin/pull/499)

- Temporarily accept orphan headers to allow for parallelism. [#497](https://github.com/swift-bitcoin/swift-bitcoin/issues/497) [#498](https://github.com/swift-bitcoin/swift-bitcoin/issues/498) [#501](https://github.com/swift-bitcoin/swift-bitcoin/pull/501)

For benchmarking the following tasks were carried:

- Better metrics sent to _statsd_ to monitor IBD performance using Graphite. [#465](https://github.com/swift-bitcoin/swift-bitcoin/pull/465) [#516](https://github.com/swift-bitcoin/swift-bitcoin/pull/516)

- Reindex utility (offline) and RPC command. [#476](https://github.com/swift-bitcoin/swift-bitcoin/issues/476) [#486](https://github.com/swift-bitcoin/swift-bitcoin/pull/486)

- Benchmarks for _get chain tips_ and _reindex from block files_ using continuous clock. [#496](https://github.com/swift-bitcoin/swift-bitcoin/issues/496)#issuecomment-3745714202 [#495](https://github.com/swift-bitcoin/swift-bitcoin/issues/495)

- Repeated profiling using Instruments and flame graphs to identify bottlenecks during IBD and reindex. [#465](https://github.com/swift-bitcoin/swift-bitcoin/pull/465)

- Added some performance tests to check certain operations complete under specified time limit [#522](https://github.com/swift-bitcoin/swift-bitcoin/pull/522)

Several improvements were made with direct impact on performance:

- Full in-memory block index with persistent DB backing. [#496](https://github.com/swift-bitcoin/swift-bitcoin/issues/496) [#504](https://github.com/swift-bitcoin/swift-bitcoin/pull/504)

- Full in-memory chain state with persistent DB backing. [#511](https://github.com/swift-bitcoin/swift-bitcoin/pull/511) [#512](https://github.com/swift-bitcoin/swift-bitcoin/pull/512)

- Adjustable cache facility for stored blocks. [#518](https://github.com/swift-bitcoin/swift-bitcoin/pull/518)

- Block disk storage serialization with actors and task chaining. [#517](https://github.com/swift-bitcoin/swift-bitcoin/pull/517) [#518](https://github.com/swift-bitcoin/swift-bitcoin/pull/518)

- Assume valid evaluation re-implemented and streamlined. [#514](https://github.com/swift-bitcoin/swift-bitcoin/pull/514) [#516](https://github.com/swift-bitcoin/swift-bitcoin/pull/516)

- Block index skip list with same deterministic formula as Bitcoin Core. [#515](https://github.com/swift-bitcoin/swift-bitcoin/pull/515) [#519](https://github.com/swift-bitcoin/swift-bitcoin/pull/519)

- Partial Swift Span adoption (more required `span` functionality coming in Swift 6.3+) [#475](https://github.com/swift-bitcoin/swift-bitcoin/pull/475)

- Span annotations for C interoperability with `libsecp256k1`. [#391](https://github.com/swift-bitcoin/swift-bitcoin/pull/391) [#475](https://github.com/swift-bitcoin/swift-bitcoin/pull/475)

- Partial adoption of official Swift Binary Parsing (framework still in development phase). [#390](https://github.com/swift-bitcoin/swift-bitcoin/pull/390) [#470](https://github.com/swift-bitcoin/swift-bitcoin/pull/470)

- Custom UInt256 type based on new Swift's Standard `UInt128` type. [#521](https://github.com/swift-bitcoin/swift-bitcoin/pull/521) [#522](https://github.com/swift-bitcoin/swift-bitcoin/pull/522)

Other notable additions outside of the main areas of focus:

- Miniscript DSL expanded with wrapper combination shortcuts and better test coverage. [#502](https://github.com/swift-bitcoin/swift-bitcoin/issues/502) [#503](https://github.com/swift-bitcoin/swift-bitcoin/pull/503) [#505](https://github.com/swift-bitcoin/swift-bitcoin/pull/505)

- First nteractive tutorials covering Bitcoin Crypto module. [#506](https://github.com/swift-bitcoin/swift-bitcoin/pull/506) [#509](https://github.com/swift-bitcoin/swift-bitcoin/pull/509)

- Idiomatic blockchain API. [#513](https://github.com/swift-bitcoin/swift-bitcoin/pull/513)

# Plans for the following quarter

For next quarter the goal continues to be to achieve somewhat decent mainnet performance (as close as possible to Bitcoin Core's) using the best tools available from the Swift language and ecosystem.
Additionally aim to continue to gear towards a 1.0 release with a stable well-documented API.
 
- Keep profiling IBD and re-index processes to identify slow code paths that may be optimized.
- Optimize serialization and binary parsing of key data types.
- Optimize use of space (storage) for UTXOs.
- Download both headers and blocks in parallel, simultaneously from multiple peers.
- Revisit auto-connect and handshake to improve reliability (some nodes disconnecting unexpectedly).
- Attempt to utilize fixed inline arrays and fixed-width 256-bit integers where possible (and and proven useful).
- Continue to explore the current public API and document with interactive tutorials.

Project's kanban board outlining the current commitment [here](https://github.com/orgs/swift-bitcoin/projects/3).
""" }
